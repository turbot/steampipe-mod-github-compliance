select
  -- Required Columns
    r.full_name as resource,
    case
    when (b.required_linear_history_enabled is not null and (b.required_linear_history_enabled)::bool = true) or (r.allow_rebase_merge = true or r.allow_squash_merge = true) then 'ok'
    else 'alarm'
    end as status,
    r.full_name || ' default branch ' || r.default_branch || case when((b.required_linear_history_enabled is not null and (b.required_linear_history_enabled)::bool = true) or (r.allow_rebase_merge = true or r.allow_squash_merge = true)) then ' has linear history enabled.' else ' has linear history disabled.' end as reason,
  -- Additional Dimensions
    r.full_name
from
    github_my_repository as r
    left join github_branch_protection as b on r.full_name = b.repository_full_name and r.default_branch = b.name;
-- where
    -- r.fork = ${local.include_forks}