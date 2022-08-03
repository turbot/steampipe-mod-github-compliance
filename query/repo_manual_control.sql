select
  -- Required Columns
  full_name as resource,
  visibility,
  'info' as status,
  'Manual verification required.' as reason,
  -- Additional Dimensions
full_name
from
  github_my_repository
where fork = 'false'
order by visibility;