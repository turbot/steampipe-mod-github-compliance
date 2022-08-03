-- section 2.4.6 using
with my_repositories as (
  select
    full_name
  from
    github_my_repository
  order by
    full_name
),
pipelines as (
  select
    name,
    repository_full_name,
    pipeline,
    html_url
  from
    github_workflow
  where
    repository_full_name in
    (
      select
        full_name
      from
        my_repositories
    )
),
build_jobs_sbom_details as (
  select
    p.repository_full_name,
    count(*) filter (
      where
         (
          (step ->> 'type' = 'task'
            and (step -> 'task' ->> 'name')::text in (
              'argonsecurity/actions/generate-manifest',
              'anchore/sbom-action',
              'CycloneDX/gh-\w+-generate-sbom'
            )
          )
          or (step ->> 'type' = 'shell'
            and ((step -> 'shell' ->> 'script')::text like glob('billy generate') or
              (step -> 'shell' ->> 'script')::text like glob('trivy sbom') or
              (step -> 'shell' ->> 'script')::text like glob('trivy .* --format cyclonedx') or
              (step -> 'shell' ->> 'script')::text like glob('syft .*') or
              (step -> 'shell' ->> 'script')::text like glob('spdx-sbom-generator') or
              (step -> 'shell' ->> 'script')::text like glob('cyclonedx-\w+') or
              (step -> 'shell' ->> 'script')::text like glob('jake sbom')
            )
          )
        )
    ) as jobs_with_sbom,
    count(*) filter (
      where
        (job -> 'metadata' -> 'build')::bool
        and (
          not (step ->> 'type' = 'task'
            and (step -> 'task' ->> 'name')::text in (
              'argonsecurity/actions/generate-manifest',
              'anchore/sbom-action',
              'CycloneDX/gh-\w+-generate-sbom'
            )
          )
          or not (step ->> 'type' = 'shell'
            and ((step -> 'shell' ->> 'script')::text like glob('billy generate') or
              (step -> 'shell' ->> 'script')::text like glob('trivy sbom') or
              (step -> 'shell' ->> 'script')::text like glob('trivy .* --format cyclonedx') or
              (step -> 'shell' ->> 'script')::text like glob('syft .*') or
              (step -> 'shell' ->> 'script')::text like glob('spdx-sbom-generator') or
              (step -> 'shell' ->> 'script')::text like glob('cyclonedx-\w+') or
              (step -> 'shell' ->> 'script')::text like glob('jake sbom')
            )
          )
        )
    ) as jobs_without_sbom
  from
    pipelines as p,
    jsonb_array_elements(pipeline -> 'jobs') as job,
    jsonb_array_elements(job -> 'steps') as step
  group by
    p.repository_full_name,
    pipeline
),
pipeline_with_sbom_job_details as (
  select
    repository_full_name,
    count(*) filter (where jobs_with_sbom > 0) as pipeline_with_sbom_jobs,
    count(*) filter (where jobs_without_sbom > 0) as pipeline_without_sbom_jobs
  from
    build_jobs_sbom_details
  group by
    repository_full_name
)
select
  mr.full_name as resource,
  case
    when ps.pipeline_without_sbom_jobs > 0 then 'alarm'
    when ps.repository_full_name is null then 'info'
    else 'ok'
  end as status,
  case
    when ps.pipeline_without_sbom_jobs > 0 then ps.pipeline_without_sbom_jobs::text || ' pipeline(s) contain a build job without SBOM generation.'
    when ps.repository_full_name is null then 'No pipelines in the repo.'
    else 'All pipeline(s) contain a build job with SBOM generation.'
  end as reason,
  mr.full_name
from
  my_repositories as mr
  left join
    pipeline_with_sbom_job_details as ps
    on mr.full_name = ps.repository_full_name;