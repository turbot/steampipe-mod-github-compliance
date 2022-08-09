with repo_admins as (
  select
    distinct
    array_agg(c ->> 'login') as admins,
    full_name
  from
    github_my_repository,
    jsonb_array_elements(collaborators) as c
  where
    (c -> 'permissions' ->> 'admin')::bool
  group by
    full_name
)
select
  -- Required Columns
  r.full_name as resource,
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
  r.full_name
from
  github_my_repository as r
  left join repo_admins as a on r.full_name = a.full_name;
