select
  -- Required Columns
  full_name as resource,
  visibility,
  'info' as status,
  'Manual verification required.' as reason,
  -- Additional Dimensions
full_name || ' default branch ' || default_branch as branch
from
  github_my_repository
order by visibility;