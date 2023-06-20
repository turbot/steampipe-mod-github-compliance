select
  -- Required Columns
  url as resource,
  case
    when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_force_pushes') = 'false' then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
  case
    when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_force_pushes') = 'false' then ' prevents force push.'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_force_pushes') = 'true' then ' allows force push.'
    -- If not false or true, then null, which means no branch protection rule exists
    else ' branch protection rule unknown.'
  end as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;
