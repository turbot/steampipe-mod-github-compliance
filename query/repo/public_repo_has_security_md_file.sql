with my_repos as (
  select
    full_name,
    default_branch,
    fork,
    visibility
  from 
    github_my_repository
  where
    full_name ~ $1
)
select
  -- Required Columns
  r.full_name as resource,
  case
    when p.security is null then 'alarm'
    else 'ok'
  end as status,
  r.full_name || 
  case 
    when(p.security is not null) then ' with ' 
    else ' without ' 
  end || 'SECURITY.md file.' as reason,
  -- Additional Dimensions
  r.full_name
from
  my_repos as r
  left join github_community_profile as p on r.full_name = p.repository_full_name
where
  r.visibility = 'public' and r.fork = false;