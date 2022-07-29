select
  html_url as resource,
  case
    when members_can_create_public_repos or members_can_create_private_repos then 'alarm'
    else 'ok'
  end as status,
  coalesce(name, login) || ' users ' || case when (members_can_create_public_repos)::bool then 'can ' else 'cannot ' end || 'create repositories.' as reason,
  login
from
  github_my_organization
