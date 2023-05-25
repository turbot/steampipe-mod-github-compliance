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
vulnerability_task_repos as (
  select distinct
    p.repository_full_name
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as job,
    jsonb_array_elements(job -> 'steps') as step
  where
    step ->> 'type' = 'task'
    and (step -> 'task' ->> 'name')::text in (
      'argonsecurity/scanner-action',
      'aquasecurity/trivy-action'
    )
)
select
  -- Required Columns
  r.full_name as resource,
  case
    when v.repository_full_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when v.repository_full_name is null then 'Automated vulnerabilities scanning is not set for pipelines.'
    else 'Automated vulnerabilities scanning is set for pipelines.'
  end as reason,
  -- Additional Dimensions
  r.full_name
from
  repositories as r
  left join vulnerability_task_repos as v on r.full_name = v.repository_full_name;