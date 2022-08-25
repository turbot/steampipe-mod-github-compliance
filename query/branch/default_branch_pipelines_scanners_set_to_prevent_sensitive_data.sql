with my_repos as (
  select
    full_name,
    default_branch
  from 
    github_my_repository
  where
    full_name ~ $1
),
pipelines as (
  select
    name,
    repository_full_name,
    pipeline
  from
    github_workflow
  where
    repository_full_name in (select full_name from my_repos)
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
  r.full_name as resource,
  case
    when v.repository_full_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when v.repository_full_name is null then 'Scanners are not set to identify and prevent sensitive data in pipeline files.'
    else 'Scanners are set to identify and prevent sensitive data in pipeline files.'
  end as reason,
  -- Additional Dimensions
  r.full_name
from
  my_repos as r
  left join vulnerability_scanner_repos as v on r.full_name = v.repository_full_name;