select
  -- Required Columns
  url as resource,
  case
    when EXTRACT(DAY FROM CURRENT_TIMESTAMP - updated_at) <= 90 then 'ok'
    else 'alarm'
  end as status,
  case
    when EXTRACT(DAY FROM CURRENT_TIMESTAMP - updated_at) <= 90 then name_with_owner || ' is active.'
    else name_with_owner || ' is inactive since ' || EXTRACT(DAY FROM CURRENT_TIMESTAMP - updated_at) || ' days.'
  end as reason,
  -- Additional Dimensions
  name_with_owner
from
  github_my_repository
where
  not is_fork
order by
  name_with_owner;