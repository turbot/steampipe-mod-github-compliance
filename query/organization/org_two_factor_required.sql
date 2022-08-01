select
  -- Required Columns
  html_url as resource,
  case
    when two_factor_requirement_enabled then 'ok'
    else 'alarm'
  end as status,
  coalesce(name, login) || case when (two_factor_requirement_enabled)::bool then ' requires 2FA' else ' does not require 2FA' end || '.' as reason,
  -- Additional Dimensions
  login
from
  github_my_organization;