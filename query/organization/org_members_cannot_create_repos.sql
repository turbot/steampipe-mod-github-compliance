select
  -- Required Columns
  url as resource,
  case
    when members_can_create_public_repos or members_can_create_private_repos then 'alarm'
    else 'ok'
  end as status,
  login || ' users ' || case when (members_can_create_public_repos)::bool or (members_can_create_private_repos)::bool then 'can ' else 'cannot ' end || 'create repositories.' as reason,
  -- Additional Dimensions
  login
from
  github_my_organization;