with my_repos as (
  select
    full_name,
    default_branch,
    fork,
    updated_at
  from 
    github_my_repository
  where
    full_name ~ $1
)
select
  -- Required Columns
  full_name as resource,
  case
    when EXTRACT(DAY FROM CURRENT_TIMESTAMP - updated_at) <= 90 then 'ok'
    else 'alarm'
  end as status,
  case
    when EXTRACT(DAY FROM CURRENT_TIMESTAMP - updated_at) <= 90 then full_name || ' is active.'
    else full_name || ' is inactive since ' || EXTRACT(DAY FROM CURRENT_TIMESTAMP - updated_at) || ' days.'
  end as reason,
  -- Additional Dimensions
  full_name
from
  my_repos
where
  not fork
order by
  full_name;