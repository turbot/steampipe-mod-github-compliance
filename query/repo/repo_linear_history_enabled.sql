select
  -- Required Columns
  url as resource,
  case
    when ((default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'requires_linear_history')::bool = true) or (rebase_merge_allowed = true or squash_merge_allowed = true) then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') || case when((default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'requires_linear_history')::bool = true) or (rebase_merge_allowed = true or squash_merge_allowed = true) then ' has linear history enabled.' else ' has linear history disabled.' end as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;