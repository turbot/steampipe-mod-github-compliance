select html_url as resource,
case 
  when count(c -> 'permissions' ->> 'admin') <= 3 then 'ok' 
  else 'alarm'
  end as status,
    full_name || case when(count(c -> 'permissions' ->> 'admin') <= 3) then ' has issue deletion permission limited to ' || count(c -> 'permissions' ->> 'admin') || ' users.' else ' has issue deletion permission for ' || count(c -> 'permissions' ->> 'admin') || ' users.' end as reason,
  -- Additional Dimensions
  full_name
from
  github_my_repository, jsonb_array_elements(collaborators) as c
  where (c -> 'permissions' ->> 'admin')::bool group by html_url, full_name
  