select
  -- Required Columns
  url as resource,
  case
    when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_code_owner_reviews')::bool is true then 'ok'
    else 'alarm'
  end as status,
    name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') || 
  case
    when (default_branch_ref -> 'branch_protection_rule') is null then ' is not protected, or you have insufficient permissions to see branch protection rules.' 
    when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_code_owner_reviews')::bool is true then ' enforces code owner''s review.' 
    else ' does not enforce code owner''s review.' 
  end as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;