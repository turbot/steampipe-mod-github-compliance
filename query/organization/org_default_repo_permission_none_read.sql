select
  -- Required Columns
  html_url as resource,
  case
    when default_repo_permission in ('read', 'none') then 'ok'
    else 'alarm'
  end as status,
  coalesce(name, login) || ' base permission is ' || default_repo_permission || '.' as reason,
  -- Additional Dimensions
  login
from
  github_my_organization;
