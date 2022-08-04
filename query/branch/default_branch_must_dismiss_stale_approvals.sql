select
  -- Required Columns
    r.full_name as resource,
    case
      when b.required_pull_request_reviews is not null and (b.required_pull_request_reviews -> 'dismiss_stale_reviews')::bool = true  then 'ok'
      else 'alarm'
    end as status,
      r.full_name || ' default branch ' || r.default_branch || case when(b.required_pull_request_reviews is not null and (b.required_pull_request_reviews -> 'dismiss_stale_reviews')::bool = true) then ' stale reviews are dimissed.' else ' stale reviews are not dimissed.' end as reason,
  -- Additional Dimensions
    r.full_name
from
  github_my_repository as r
  left join github_branch_protection as b on r.full_name = b.repository_full_name and r.default_branch = b.name;