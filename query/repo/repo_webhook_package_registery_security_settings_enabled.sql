with hooks_info as (
  select
    name,
    h as hook
  from
    github_my_organization,
    jsonb_array_elements(hooks) h
  union
  select
    name,
    h as hook
  from
    github_my_repository,
    jsonb_array_elements(hooks) h
)
select
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
      or hook -> 'config' ->> 'url' not like '%https:%')) then (hook ->> 'id') || ' is an insecure hook'
    else (hook ->> 'id') || ' is a secure hook'
  end as reason
from
  hooks_info;