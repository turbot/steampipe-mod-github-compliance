with my_repos as (
  select
    full_name
  from 
    github_my_repository
  where
    full_name ~ $2
),
collaborators as (
  select
    r.full_name,
    jsonb_array_elements(r.collaborators) as collaborator
  from
    github_repository r
  join 
    my_repos m 
  on
    m.full_name = r.full_name
  group by
    r.full_name,
    r.collaborators
),
admins as (
  select
    full_name,
    array_agg(collaborator ->> 'login') as admins
  from
    collaborators
  where
    (collaborator -> 'permissions' ->> 'admin')::bool
  group by
    full_name
)
select
  -- Required Columns
  full_name as resource,
  case
    when array_length(admins,1) - array_length($1::text[],1) > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when array_length(admins,1) - array_length($1::text[],1) > 0
      then concat( 'Repository deletion permission allowed to untrusted users ', (to_jsonb(admins) - $1::text[])::text )
    else 'Repository deletion permission limited to trusted users.'
  end as reason,
  -- Additional Dimensions
  full_name
from
  admins 
