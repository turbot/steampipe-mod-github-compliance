-- pgFormatter-ignore
-- section 2.3.7 using
with my_repositories as (
  select
    default_branch,
    full_name
  from
    github_repository
  where
    full_name = 'new-testing-org/test-public-repo'
  -- from
  --   github_my_repository
  -- order by
  --   full_name
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
unpinned_task_count as (
  select
    COUNT(*) FILTER (WHERE step ->> 'type' = 'task' and (step -> 'task' ->> 'version_type')::text != 'commit' ) as unpinned_task_count,
    COUNT(*) FILTER (WHERE step ->> 'type' = 'task' and (step -> 'task' ->> 'version_type')::text = 'commit' ) as pinned_task_count,
    p.repository_full_name
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as job,
    jsonb_array_elements(job -> 'steps') as step
  group by
    repository_full_name
)
select
  mr.full_name as resource,
  case
    when utc.unpinned_task_count > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when utc.unpinned_task_count > 0 then unpinned_task_count::text || ' task(s) are not pinned.'
    when utc.repository_full_name is null then 'no build task(s) in the repo.'
    else 'All task(s) are pinned.'
  end as reason
from
  my_repositories as mr
  left join
    unpinned_task_count as utc
    on mr.full_name = utc.repository_full_name;

