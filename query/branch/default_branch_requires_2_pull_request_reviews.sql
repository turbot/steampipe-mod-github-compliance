select
  -- Required Columns
  url as resource,
  case
    when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
    when (default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'required_approving_review_count')::integer >= 2 then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') || 
  case
    when (default_branch_ref -> 'branch_protection_rule') is null then ' is not protected, or you have insufficient permissions to see branch protection rules.' 
    when (default_branch_ref -> 'branch_protection_rule' ->> 'required_approving_review_count')::integer >= 2 then ' has at least two pull request reviews.' 
    else ' does not have at least two pull request reviews.' 
  end as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;