select
  -- Required Columns
  url as resource,
  case
    when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_status_checks')::bool = true then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') || 
  case
    when (default_branch_ref -> 'branch_protection_rule') is not null then ' branch protection status unknown.'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_status_checks')::bool = true then ' requires status checks.'
    else ' does not require status checks.'
  end as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;
