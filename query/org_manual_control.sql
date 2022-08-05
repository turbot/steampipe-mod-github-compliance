-- select
--   -- Required Columns
--   name as resource,
--   'info' as status,
--   'Manual verification required with ' as reason,
--   -- Additional Dimensions
--   name as organization_name
-- from
--   github_my_organization;

select
  -- Required Columns
  'organization' as resource,
  'info' as status,
  'Manual verification required for organizations ' as reason
