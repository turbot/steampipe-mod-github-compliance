select
  -- Required Columns
  url as resource,
  case
    when delete_branch_on_merge then 'ok'
    else 'alarm'
  end as status,
  name_with_owner || ' delete branch on merge is ' || case when(delete_branch_on_merge)::bool then 'enabled' else 'disabled' end || '.' as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository;