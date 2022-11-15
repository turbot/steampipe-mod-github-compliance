select
  -- Required Columns
  m.login as resource,
  case
    when m.has_two_factor_enabled is false then 'alarm'
    when m.has_two_factor_enabled is true then 'ok'
    else 'info'
  end as status,
  case
    when m.has_two_factor_enabled is false then m.login || ' does not have MFA enabled'
    when m.has_two_factor_enabled is true then m.login || ' has MFA enabled'
    else 'Cannot determine MFA of ' || m.login || '. Manual verification required.'
  end as reason,
  -- Additional Dimensions
  m.organization
from
  github_organization_member m
  join github_my_organization o on m.organization = o.login
group by
  m.organization,
  m.has_two_factor_enabled,
  m.login;