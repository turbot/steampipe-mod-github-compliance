select
  -- Required Columns
    html_url as resource,
  case
    when delete_branch_on_merge then 'ok'
    else 'alarm'
  end as status,
  full_name || ' delete branch on merge is ' || case when(delete_branch_on_merge)::bool then 'enabled' else 'disabled' end || '.' as reason,
  -- Additional Dimensions
  full_name
from
  github_my_repository
-- where
    -- r.fork = ${local.include_forks}
