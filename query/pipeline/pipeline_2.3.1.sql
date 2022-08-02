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
    repository_full_name in (select full_name from my_repositories)
),
bulid_jobs as (
  select
    p.name as pipeline_name,
    j -> 'name' as job_name,
    p.repository_full_name
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as j
  where (j -> 'metadata' -> 'build')::bool
)
select distinct
  mr.full_name as resource,
  case
    when (select count(*) from bulid_jobs where repository_full_name = mr.full_name group by repository_full_name) > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when (select count(*) from bulid_jobs where repository_full_name = mr.full_name group by repository_full_name) > 0 then 'All build steps are defined as code.'
    else 'No build steps defined as code.'
  end as reason
from
  my_repositories as mr
  left join pipelines as p
    on mr.full_name = p.repository_full_name;

