select
  -- Required Columns
  url as resource,
  case
    when (default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'requires_strict_status_checks')::bool = true then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
  case
    when((default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'requires_strict_status_checks')::bool = true) then ' requires '
    else ' does not require '
  end || 'open branches to be upto date before merge.' as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;