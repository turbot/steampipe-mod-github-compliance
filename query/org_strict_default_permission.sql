select
  html_url as resource,
  case
    when default_repo_permission in ('read', 'none') then 'ok'
    else 'alarm'
  end as status,
  coalesce(name, login) || case when (default_repo_permission in ('Read', 'None')) then ' has strict base permissions' else ' does not have strict base permissions' end || '.' as reason,
  login
from
  github_my_organization