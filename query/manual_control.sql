select
  -- Required Columns
  html_url as resource,
  visibility,
  'info' as status,
  'Manual verification required.' as reason,
  -- Additional Dimensions
  full_name
from
  github_my_repository
order by visibility;