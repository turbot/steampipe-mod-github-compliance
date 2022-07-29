select
  u.login,
  o.login as organization,
  u.name,
  u.company,
  u.location,
  u.twitter_username,
  u.bio
from
  github_user as u,
  github_my_organization as o,
  jsonb_array_elements_text(o.member_logins) as member_login
where
  u.login = member_login;