select
  -- Required Columns
  r.full_name as resource,
  case
    when b.allow_force_pushes_enabled = 'false' then 'ok'
    else 'alarm'
  end as status,
  r.full_name || ' default branch ' || r.default_branch ||
  case
    when b.allow_force_pushes_enabled = 'false' then ' prevents force push.'
    when b.allow_force_pushes_enabled = 'true' then ' allows force push.'
    -- If not false or true, then null, which means no branch protection rule exists
    else ' is not protected.'
  end as reason,
  -- Additional Dimensions
  r.full_name
from
  github_my_repository as r
  left join github_branch_protection as b on r.full_name = b.repository_full_name and r.default_branch = b.name;
