select
  -- Required Columns
  url as resource,
  case
    when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_deletions') = 'false' then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
  case
    when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_deletions') = 'false' then ' prevents deletions.'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_deletions') = 'true' then ' allows deletions.'
    -- If not false or true, then null, which means no branch protection rule exists
    else ' is not protected.'
  end as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;