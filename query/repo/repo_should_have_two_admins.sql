with repo_admins as (
  select
    name_with_owner,
    url,
    count(user_login) as admins
  from github_my_repository r
  join github_repository_collaborator c
  on r.name_with_owner = c.repository_full_name
  and c.permission = 'ADMIN'
group by name_with_owner, url
)
select
  url as resource,
  case
    when admins >= 2 then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || case when admins >= 2 then ' has ' || admins::text || ' administrators.' else ' has only ' || admins::text || ' administrators.' end as reason,
  name_with_owner
from repo_admins