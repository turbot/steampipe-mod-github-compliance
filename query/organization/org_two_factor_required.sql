select
  -- Required Columns
  o.url as resource,
  case
    when ow.requires_two_factor_authentication is null then 'info' -- info is only available to owners
    when ow.requires_two_factor_authentication then 'ok'
    else 'alarm'
  end as status,
  coalesce(o.name, o.login) || case
    when (ow.requires_two_factor_authentication)::bool is null then ' two-factor authentication unknown, manual verification required'
    when (ow.requires_two_factor_authentication)::bool then ' requires two-factor authentication'
    else ' does not require two-factor authentication' end || '.' as reason,
  -- Additional Dimensions
  o.login
from
  github_my_organization o
join github_organization_owner ow on o.login = ow.login;
