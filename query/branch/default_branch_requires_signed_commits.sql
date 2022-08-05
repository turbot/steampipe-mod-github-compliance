select
  -- Required Columns
  r.full_name as resource,
  case
    when b.signatures_protected_branch_enabled is not null and (b.signatures_protected_branch_enabled)::bool = true then 'ok'
    else 'alarm'
    end as status,
    r.full_name || ' default branch ' || r.default_branch || case when(b.signatures_protected_branch_enabled is not null and (b.signatures_protected_branch_enabled)::bool = true) then ' requires ' else ' does not require ' end || 'signed commits before merge.' as reason,
  -- Additional Dimensions
  r.full_name
from
  github_my_repository as r
  left join github_branch_protection as b on r.full_name = b.repository_full_name and r.default_branch = b.name;