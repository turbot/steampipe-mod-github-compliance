select
  -- Required Columns
    r.full_name as resource,
    case
    when b.required_status_checks is not null and (b.required_status_checks -> 'strict')::bool = true then 'ok'
    else 'alarm'
    end as status,
    r.full_name || ' default branch ' || r.default_branch || case when(b.required_status_checks is not null and (b.required_status_checks -> 'strict')::bool = true) then ' requires ' else ' does not require ' end || 'statuss checks.' as reason,
  -- Additional Dimensions
    r.full_name
from
    github_my_repository as r
    left join github_branch_protection as b on r.full_name = b.repository_full_name and r.default_branch = b.name
-- where
    -- r.fork = ${local.include_forks}