with repositories as (
  select
    name_with_owner,
    url
  from
    github_my_repository
  order by
    name_with_owner
),
pipelines as (
  select
    name,
    repository_full_name,
    pipeline
  from
    github_workflow
  where
    repository_full_name in (select name_with_owner from repositories)
),
build_jobs as (
  select distinct
    p.repository_full_name
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as j
  where
    (j -> 'metadata' -> 'build')::bool
)
select distinct
  -- Required Columns
  r.url as resource,
  case
    when j.repository_full_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when j.repository_full_name is null then 'No build steps are defined as code.'
    else 'All build steps are defined as code.'
  end as reason,
  -- Additional Dimensions
  r.name_with_owner
from
  repositories as r
  left join build_jobs as j on r.name_with_owner = j.repository_full_name;
