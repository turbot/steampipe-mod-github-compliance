with hooks_info as (
  select
    login as name,
    h as hook
  from
    github_my_organization_v3,
    jsonb_array_elements(hooks) h
  union
  select
    name,
    h as hook
  from
    github_my_repository_v3,
    jsonb_array_elements(hooks) h
)
select
  -- Required Columns
  hook -> 'id' as resource,
  case
    when (hook ->> 'active' = 'true'
      and (hook -> 'config' ->> 'insecure_ssl' = '1'
      or hook -> 'config' ->> 'secret' is null
      or hook -> 'config' ->> 'url' not like '%https:%')) then 'alarm'
    else 'ok'
  end as status,
  case
    when (hook ->> 'active' = 'true'
      and (hook -> 'config' ->> 'insecure_ssl' = '1'
      or hook -> 'config' ->> 'secret' is null
      or hook -> 'config' ->> 'url' not like '%https:%')) then (hook ->> 'id') || ' is an insecure hook.'
    else (hook ->> 'id') || ' is a secure hook.'
  end as reason,
  -- Additional Dimensions
  name
from
  hooks_info;