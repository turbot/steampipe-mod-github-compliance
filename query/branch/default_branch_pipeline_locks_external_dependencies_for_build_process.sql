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
unpinned_task_count as (
  select
    count(*) filter (where step ->> 'type' = 'task' and (step -> 'task' ->> 'version_type')::text != 'commit' ) as unpinned_task_count,
    count(*) filter (where step ->> 'type' = 'task' and (step -> 'task' ->> 'version_type')::text = 'commit' ) as pinned_task_count,
    p.repository_full_name
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as job,
    jsonb_array_elements(job -> 'steps') as step
  group by
    repository_full_name
)
select
  -- Required Columns
  r.url as resource,
  case
    when u.unpinned_task_count > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when u.unpinned_task_count > 0 then unpinned_task_count::text || ' task(s) are not pinned.'
    when u.repository_full_name is null then 'No build task(s) in the repository.'
    else 'All task(s) are pinned.'
  end as reason,
  -- Additional Dimensions
  r.name_with_owner
from
  repositories as r
  left join unpinned_task_count as u on r.name_with_owner = u.repository_full_name;