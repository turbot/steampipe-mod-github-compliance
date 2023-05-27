select
  -- Required Columns
  url as resource,
  case
    when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'restricts_review_dismissals')::bool = true then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
  case
    when (default_branch_ref -> 'branch_protection_rule') is null then ' is not protected, or you have insufficient permissions to see branch protection rules.'
    when (default_branch_ref -> 'branch_protection_rule' ->> 'restricts_review_dismissals')::bool = true then ' has code change review dismissal restrictions.'
    else ' does not have code change review dismissal restrictions.'
  end as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;