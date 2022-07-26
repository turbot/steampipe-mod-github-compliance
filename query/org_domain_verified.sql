select
  html_url as resource,
  case
    when is_verified then 'ok'
    else 'alarm'
  end as status,
  coalesce(name, login) || ' domain is ' || case when (is_verified)::bool then 'verified' else 'not verified' end || '.' as reason,
  login
from
  github_my_organization