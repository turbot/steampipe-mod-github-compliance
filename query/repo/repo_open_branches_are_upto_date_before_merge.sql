with my_repos as (
  select
    full_name,
    default_branch
  from 
    github_my_repository
  where
    full_name ~ $1
)
select
  -- Required Columns
  r.full_name as resource,
  case
    when b.required_status_checks is not null and (b.required_status_checks -> 'strict')::bool = true then 'ok'
    else 'alarm'
  end as status,
    r.full_name || ' default branch ' || r.default_branch || 
    case 
      when(b.required_status_checks is not null and (b.required_status_checks -> 'strict')::bool = true) then ' requires ' 
      else ' does not require ' 
    end || 'open branches to be upto date before merge.' as reason,
  -- Additional Dimensions
  r.full_name
from
  my_repos as r
  left join github_branch_protection as b on r.full_name = b.repository_full_name and r.default_branch = b.name;