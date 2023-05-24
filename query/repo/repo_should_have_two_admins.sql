select
  -- Required Columns
  html_url as resource,
  case
    when count(c -> 'permissions' ->> 'admin') >= 2 then 'ok'
    else 'alarm'
  end as status,
    full_name || case when(count(c -> 'permissions' ->> 'admin') >= 2) then ' has ' || count(c -> 'permissions' ->> 'admin') || ' administrators.' else ' has only ' || count(c -> 'permissions' ->> 'admin') || ' administrator.' end as reason,
  -- Additional Dimensions
  full_name
from
  github_my_repository, jsonb_array_elements(collaborators) as c
where (c -> 'permissions' ->> 'admin')::bool group by html_url, full_name;

/*
with repos as (select name_with_owner from github_my_repository)
select
  r.name_with_owner as repo,
  count(user_login) as admins
from repos as r
inner join 
  github_repository_collaborator as c
on 
  r.name_with_owner = c.repository_full_name
group by r.name_with_owner
*/