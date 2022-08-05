select
  -- Required Columns
    r.full_name as resource,
    case
      when b.required_pull_request_reviews is not null and (b.required_pull_request_reviews -> 'require_code_owner_reviews')::bool is true  then 'ok'
      else 'alarm'
    end as status,
      r.full_name || ' default branch ' || r.default_branch || case when(b.required_pull_request_reviews is not null and (b.required_pull_request_reviews -> 'require_code_owner_reviews')::bool is true) then ' enforces code owner''s review.' else ' does not enforce code owner''s review.' end as reason,
  -- Additional Dimensions
    r.full_name
from
    github_my_repository as r
    left join github_branch_protection as b on r.full_name = b.repository_full_name and r.default_branch = b.name;