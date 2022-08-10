select
  -- Required Columns
  r.full_name as resource,
  case
    when p.security is null then 'alarm'
    else 'ok'
  end as status,
  r.full_name || case when(p.security is not null) then ' with ' else ' without ' end || 'SECURITY.md file.' as reason,
  -- Additional Dimensions
  r.full_name
from
  github_my_repository as r
  left join github_community_profile as p on r.full_name = p.repository_full_name
where
  visibility = 'public' and r.fork = false;