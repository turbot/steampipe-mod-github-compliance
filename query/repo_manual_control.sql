-- select
--   -- Required Columns
--   name as resource,
--   'info' as status,
--   'Manual verification required for repositories within organization ' as reason,
--   -- Additional Dimensions
--   name as organization_name
-- from
--   github_my_organization;

select
  -- Required Columns
  'repository' as resource,
  'info' as status,
  'Manual verification required for repositories ' as reason
