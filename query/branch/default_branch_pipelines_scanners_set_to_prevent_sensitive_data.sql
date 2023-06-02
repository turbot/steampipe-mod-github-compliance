with repositories as (
  select
    name_with_owner
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
vulnerability_scanner_repos as (
  select distinct
    p.repository_full_name
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as job,
    jsonb_array_elements(job -> 'steps') as step
  where
    (step ->> 'type' = 'task'
    and (step -> 'task' ->> 'name')::text in (
      'argonsecurity/scanner-action',
      'aquasecurity/trivy-action',
      'zricethezav/gitleaks-action',
      'ShiftLeftSecurity/scan-action'
    )) or
    (step ->> 'type' = 'shell'
    and ((step -> 'shell' ->> 'script')::text like glob('spectral.* scan') or
      (step -> 'shell' ->> 'script')::text like glob('git secrets --scan') or
      (step -> 'shell' ->> 'script')::text like glob('whispers') or
      (step -> 'shell' ->> 'script')::text like glob('docker run.* abhartiya/tools_gitallsecrets') or
      (step -> 'shell' ->> 'script')::text like glob('detect-secrets.* scan')
    ))
)
select
  -- Required Columns
  r.name_with_owner as resource,
  case
    when v.repository_full_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when v.repository_full_name is null then 'Scanners are not set to identify and prevent sensitive data in pipeline files.'
    else 'Scanners are set to identify and prevent sensitive data in pipeline files.'
  end as reason,
  -- Additional Dimensions
  r.name_with_owner
from
  repositories as r
  left join vulnerability_scanner_repos as v on r.name_with_owner = v.repository_full_name;