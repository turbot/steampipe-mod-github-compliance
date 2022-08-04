select
  -- Required Columns
  m.organization as resource,
  case
    when count(m.login) < 2 then 'alarm'
    else 'ok'
  end as status,
  case
    when count(m.login) < 2 then m.organization || ' has less than 2 admins'
    else m.organization || ' has minimum required admins'
  end as reason
from
  github_organization_member m
  join github_my_organization o on m.organization = o.login
where
  role = 'admin'
group by role, m.organization;