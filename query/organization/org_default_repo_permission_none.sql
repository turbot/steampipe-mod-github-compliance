select
  -- Required Columns
  html_url as resource,
  case
    when default_repo_permission is null then 'skip'
    when default_repo_permission = 'none' then 'ok'
    else 'alarm'
  end as status,

  case
    when default_repo_permission is null then 'user is not an owner of this repo'
    else
      coalesce(name, login) || ' base permission is ' || default_repo_permission || '.'
  end as reason,
  -- Additional Dimensions
  login
from
  github_my_organization;
