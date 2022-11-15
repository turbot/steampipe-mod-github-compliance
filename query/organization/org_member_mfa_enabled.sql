select
  -- Required Columns
  m.login as resource,
  case
    when m.has_two_factor_enabled is null then 'info'
    when m.has_two_factor_enabled then 'ok'
    else 'alarm'
  end as status,
  m.login || case
    when m.has_two_factor_enabled is null then ' MFA status unknown. Manual verification required.'
    when m.has_two_factor_enabled then ' MFA enabled.'
    else ' MFA not enabled.'
  end as reason,
  -- Additional Dimensions
  m.organization
from
  github_organization_member m
  join github_my_organization o on m.organization = o.login;
