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
  r.full_name as resource,
  case
    when v.repository_full_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when v.repository_full_name is null then 'Scanners are not set to identify and prevent sensitive data in pipeline files.'
    else 'Scanners are set to identify and prevent sensitive data in pipeline files.'
  end as reason,
  r.full_name
from
  repositories as r
  left join
    vulnerability_scanner_repos as v
    on r.full_name = v.repository_full_name;

