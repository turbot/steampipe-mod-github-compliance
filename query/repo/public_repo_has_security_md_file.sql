select
  -- Required Columns
  r.url as resource,
  case
    when p.security is null then 'alarm'
    else 'ok'
  end as status,
  r.name_with_owner || case when(p.security is not null) then ' with ' else ' without ' end || 'SECURITY.md file.' as reason,
  -- Additional Dimensions
  r.name_with_owner
from
  github_my_repository as r
  left join github_community_profile as p on r.name_with_owner = p.repository_full_name
where
  visibility = 'PUBLIC' and r.is_fork = false;