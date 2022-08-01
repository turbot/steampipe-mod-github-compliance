select
  -- Required Columns
    r.full_name as resource,
    case
    when b.required_pull_request_reviews is not null and (b.required_pull_request_reviews -> 'required_approving_review_count')::integer >= 2 then 'ok'
    else 'alarm'
    end as status,
    r.full_name || ' default branch ' || r.default_branch || case when(b.required_pull_request_reviews is not null and (b.required_pull_request_reviews -> 'required_approving_review_count')::integer >= 2) then ' has ' else ' does not have ' end || 'atleast two pull request reviews.' as reason,
  -- Additional Dimensions
    r.full_name
from
    github_my_repository as r
    left join github_branch_protection as b on r.full_name = b.repository_full_name and r.default_branch = b.name;
-- where
    -- r.fork = ${local.include_forks}