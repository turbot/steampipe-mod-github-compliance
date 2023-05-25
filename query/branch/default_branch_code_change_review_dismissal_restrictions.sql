select
  -- Required Columns
  url as resource,
  case
    when (default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'restricts_review_dismissals')::bool = true then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
  case
    when((default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'restricts_review_dismissals')::bool = true) then ' has '
    else ' does not have '
  end || 'code change review dismissal restrictions.' as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;