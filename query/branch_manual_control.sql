-- select
--   -- Required Columns
--   full_name as resource,
--   visibility,
--   'info' as status,
--   'Manual verification required.' as reason,
--   -- Additional Dimensions
-- full_name || ' default branch ' || default_branch as branch
-- from
--   github_my_repository
-- order by visibility;

-- select
--   -- Required Columns
--   name as resource,
--   'info' as status,
--   'Manual verification required for repository branches within organization ' as reason,
--   -- Additional Dimensions
--   name as organization_name
-- from
--   github_my_organization

select
  -- Required Columns
  'branch' as resource,
  'info' as status,
  'Manual verification required for branches ' as reason