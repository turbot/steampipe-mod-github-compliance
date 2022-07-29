select
  -- Required Columns
  html_url as resource,
  visibility,
  'info' as status,
  full_name || ' default branch ' || default_branch || 
  ' requires manual verification.' as reason,
  -- Additional Dimensions
  full_name
from
  github_my_repository
order by visibility;