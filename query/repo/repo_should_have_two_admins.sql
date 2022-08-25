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
    when array_length(admins,1) < 2 then 'alarm'
    else 'ok'
  end as status,
  full_name ||
  case
    when array_length(admins,1) < 2
      then ' has only ' || array_length(admins,1) || ' administrator.'
    else ' has ' || array_length(admins,1) || ' administrators.'
  end as reason,
  -- Additional Dimensions
  full_name
from
  admins;