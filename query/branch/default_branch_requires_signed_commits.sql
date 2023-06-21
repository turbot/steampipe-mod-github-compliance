select
  -- Required Columns
  url as resource,
  case
    when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_commit_signatures')::bool = true then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') || 
  case 
    when (default_branch_ref -> 'branch_protection_rule') is null then ' branch protection rule unknown.'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_commit_signatures')::bool = true then ' requires signed commits before merge.' 
    else ' does not require signed commits before merge.' 
  end as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;
