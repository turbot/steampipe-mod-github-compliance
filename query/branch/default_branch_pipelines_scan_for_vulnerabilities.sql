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
  r.url as resource,
  case
    when v.repository_full_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when v.repository_full_name is null then 'Automated vulnerabilities scanning is not set for pipelines.'
    else 'Automated vulnerabilities scanning is set for pipelines.'
  end as reason,
  -- Additional Dimensions
  r.name_with_owner
from
  repositories as r
  left join vulnerability_task_repos as v on r.name_with_owner = v.repository_full_name;