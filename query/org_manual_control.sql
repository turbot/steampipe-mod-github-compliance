select
  -- Required Columns
  html_url as resource,
  'info' as status,
  'Manual verification required.' as reason,
  -- Additional Dimensions
login
from
  github_organization