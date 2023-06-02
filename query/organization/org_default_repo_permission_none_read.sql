select
  -- Required Columns
  url as resource,
  case
    when default_repo_permission is null then 'info'
    when default_repo_permission in ('read', 'none') then 'ok'
    else 'alarm'
  end as status,
  login || case
    when default_repo_permission is null then ' base permission unknown, manual verification required.'
    else ' base permission is ' || default_repo_permission || '.'
  end as reason,
  -- Additional Dimensions
  login
from
  github_my_organization;
