select
  r.full_name as resource,
  case
    when b.allow_deletions_enabled = 'false' then 'ok'
    else 'alarm'
  end as status,
  r.full_name || ' default branch ' || r.default_branch ||
    case
      when b.allow_deletions_enabled = 'false' then ' prevents deletion.'
      when b.allow_deletions_enabled = 'true' then ' allows deletion.'
      -- If not false or true, then null, which means no branch protection rule exists
      else ' is not protected.'
    end as reason,
  r.full_name
from
  github_my_repository as r
  left join github_branch_protection as b on r.full_name = b.repository_full_name and r.default_branch = b.name;
-- where
    -- r.fork = ${local.include_forks}