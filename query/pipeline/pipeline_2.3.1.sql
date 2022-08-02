-- pgFormatter-ignore
with my_repositories as (
  select
    default_branch,
    full_name
  from
    github_my_repository
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
    repository_full_name in
    (
      select
        full_name
      from
        my_repositories
    )
),
bulid_jobs as (
  select distinct
    p.repository_full_name
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as j
  where
    (j -> 'metadata' -> 'build')::bool
)
select distinct
  mr.full_name as resource,
  case
    when bj.repository_full_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when bj.repository_full_name is null then 'No build steps defined as code.'
      else 'All build steps are defined as code.'
  end as reason
from
  my_repositories as mr
  left join
    bulid_jobs as bj
    on mr.full_name = bj.repository_full_name;