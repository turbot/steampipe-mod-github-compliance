with repo_admins as (
  select distinct
    name_with_owner,
    array_agg(user_login) as admins
  from 
    github_my_repository r
  join 
    github_repository_collaborator c
  on 
    r.name_with_owner = c.repository_full_name
  and 
    c.permission = 'ADMIN'
  group by 
    name_with_owner
)
select
  -- Required Columns
  r.name_with_owner as resource,
  case
    when jsonb_array_length(to_jsonb(admins) - $1::text[]) > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when jsonb_array_length(to_jsonb(admins) - $1::text[]) > 2
      then concat( 'Repository issue deletion permission allowed to untrusted users ', to_jsonb(admins) - $1::text[] #>> '{0}', ', ', to_jsonb(admins) - $1::text[] #>> '{1}', ' and ', (jsonb_array_length(to_jsonb(admins) - $1::text[]) - 2)::text, ' more.')
    when jsonb_array_length(to_jsonb(admins) - $1::text[]) = 2
      then concat('Repository issue deletion permission allowed to untrusted users ', to_jsonb(admins) - $1::text[] #>> '{0}', ' and ', to_jsonb(admins) - $1::text[] #>> '{1}', '.')
    when jsonb_array_length(to_jsonb(admins) - $1::text[]) = 1
      then concat('Repository issue deletion permission allowed to untrusted user ', to_jsonb(admins) - $1::text[] #>> '{0}', '.')
    else 'Repository issue deletion permission limited to trusted users.'
  end as reason,
  -- Additional Dimensions
  r.name_with_owner
from
  github_my_repository as r
  left join repo_admins as a on r.name_with_owner = a.name_with_owner;
