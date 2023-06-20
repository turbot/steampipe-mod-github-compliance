select
  -- Required Columns
  url as resource,
  case
    when two_factor_requirement_enabled is null then 'info' -- info is only available to owners
    when two_factor_requirement_enabled then 'ok'
    else 'alarm'
  end as status,
  coalesce(name, login) || case
    when (two_factor_requirement_enabled)::bool is null then ' two-factor authentication unknown, manual verification required'
    when (two_factor_requirement_enabled)::bool then ' requires two-factor authentication'
    else ' does not require two-factor authentication' end || '.' as reason,
  -- Additional Dimensions
  login
from
  github_my_organization;

