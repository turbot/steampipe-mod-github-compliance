select
  -- Required Columns
  html_url as resource,
  case
    when count(c -> 'permissions' ->> 'admin') >= 2 then 'ok'
    else 'alarm'
  end as status,
    full_name || case when(count(c -> 'permissions' ->> 'admin') >= 2) then ' has ' || count(c -> 'permissions' ->> 'admin') || ' administrators.' else ' has only ' || count(c -> 'permissions' ->> 'admin') || ' administrator.' end as reason,
  -- Additional Dimensions
  full_name
from
  github_my_repository, jsonb_array_elements(collaborators) as c
where (c -> 'permissions' ->> 'admin')::bool group by html_url, full_name;