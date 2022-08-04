with repositories as (
  select
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
    repository_full_name in (select full_name from repositories)
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
  r.full_name as resource,
  case
    when u.unpinned_task_count > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when u.unpinned_task_count > 0 then unpinned_task_count::text || ' task(s) are not pinned.'
    when u.repository_full_name is null then 'no build task(s) in the repo.'
    else 'All task(s) are pinned.'
  end as reason,
  r.full_name
from
  repositories as r
  left join unpinned_task_count as u on r.full_name = u.repository_full_name;
