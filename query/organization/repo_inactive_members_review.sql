with repo as (
  select
    repository_full_name,
    count(sha) as commit_count,
    author_login
  from
    github_commit c
    join github_my_repository r on c.repository_full_name = r.name_with_owner
  where
    authored_date >= now() - interval '30 day'
  group by
    repository_full_name,
    author_login
),
logins as (
  select
    c.user_login as login,
    name_with_owner as repository_full_name
  from
    github_my_repository
    join github_repository_collaborator c on c.repository_full_name = name_with_owner
)
select
  -- Required Columns
  l.repository_full_name as resource,
  case when commit_count is null then
    'alarm'
  else
    'ok'
  end as status,
  case when commit_count is null then
    login || ' is an inactive user.'
  else
    login || ' is an active user.'
  end as reason,
  -- Additional Dimensions
  l.repository_full_name
from
  logins l
  left join repo r on l.login = r.author_login
    and l.repository_full_name = r.repository_full_name;

