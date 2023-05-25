with repositories as (
  select
    full_name
  from
    github_my_repository_v3
  order by
    full_name
),
pipelines as (
  select
    name,
    repository_full_name,
    pipeline
  from
    github_workflow
  where
    repository_full_name in (select full_name from repositories)
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
  r.full_name as resource,
  case
    when j.repository_full_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when j.repository_full_name is null then 'No build steps are defined as code.'
    else 'All build steps are defined as code.'
  end as reason,
  -- Additional Dimensions
  r.full_name
from
  repositories as r
  left join build_jobs as j on r.full_name = j.repository_full_name;
