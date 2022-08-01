-- section 2.3.1
with default_branch_info as (
  select
    default_branch,
    full_name
  from
    github_repository
  where
    full_name = 'turbot/steampipe-plugin-aws'
    -- full_name = 'LalitTurbot/detect-secrets'
),
pipelines as (
  select
    name,
    repository_full_name,
    pipeline
  from
    github_workflow
  where
    repository_full_name = 'turbot/steampipe-plugin-aws'
    -- repository_full_name = 'LalitTurbot/detect-secrets'
),
bulid_jobs as (
  select
    p.name as pipeline_name,
    j -> 'name' as job_name,
    p.repository_full_name
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as j
  where (j -> 'metadata' -> 'build')::bool
)
select
  df.full_name as resource,
  case
    when (select count(*) from bulid_jobs) > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when (select count(*) from bulid_jobs) > 0 then 'All build steps are defined as code.'
    else 'No build steps defined as code.'
  end as reason
from
  default_branch_info as df
  left join pipelines as p
on
  df.full_name = p.repository_full_name
limit 1;


-- +-----------------------------+--------+--------------------------------------+
-- | resource                    | status | reason                               |
-- +-----------------------------+--------+--------------------------------------+
-- | turbot/steampipe-plugin-aws | ok     | All build steps are defined as code. |
-- +-----------------------------+--------+--------------------------------------+

-- section 2.3.1 using github_my_repository
with default_branch_info as (
  select
    default_branch,
    full_name
  from
    github_my_repository
  -- where
  --   full_name = 'turbot/steampipe-plugin-aws'
),
pipelines as (
  select
    name,
    repository_full_name,
    pipeline
  from
    github_workflow
  where
    -- repository_full_name = 'turbot/steampipe-plugin-aws'
    repository_full_name in (select full_name from github_my_repository)
  -- limit 10 does not work Error: GET https://api.github.com/repos/turbot/steampipe-plugin-chaos/contents/.github/workflows/acceptance-tests.yml?ref=main: 404 Not Found [] (SQLSTATE HV000)
),
bulid_jobs as (
  select
    p.name as pipeline_name,
    j -> 'name' as job_name,
    p.repository_full_name
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as j
  where (j -> 'metadata' -> 'build')::bool
)
select
  df.full_name as resource,
  case
    when (select count(*) from bulid_jobs) > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when (select count(*) from bulid_jobs) > 0 then 'All build steps are defined as code.'
    else 'No build steps defined as code.'
  end as reason
from
  default_branch_info as df
  left join pipelines as p
on
  df.full_name = p.repository_full_name
limit 1;

