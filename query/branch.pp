query "default_branch_all_build_steps_as_code" {
  sql = <<-EOQ
    with repositories as (
      select
        name_with_owner,
        url
      from
        github_my_repository
      order by
        name_with_owner
    ),
    pipelines as (
      select
        name,
        repository_full_name,
        pipeline
      from
        github_workflow
      where
        repository_full_name in (select name_with_owner from repositories)
    ),
    build_jobs as (
      select distinct
        p.repository_full_name
      from
        pipelines as p,
        jsonb_array_elements(pipeline -> 'jobs') as j
      where
        (j -> 'metadata' -> 'build')::bool
    )
    select distinct
      -- Required Columns
      r.url as resource,
      case
        when j.repository_full_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when j.repository_full_name is null then 'No build steps are defined as code.'
        else 'All build steps are defined as code.'
      end as reason,
      -- Additional Dimensions
      r.name_with_owner
    from
      repositories as r
      left join build_jobs as j on r.name_with_owner = j.repository_full_name;
  EOQ
}

query "default_branch_blocks_force_push" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_force_pushes') = 'false' then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_force_pushes') = 'false' then ' prevents force push.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_force_pushes') = 'true' then ' allows force push.'
        -- If not false or true, then null, which means no branch protection rule exists
        else ' branch protection rule unknown.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "default_branch_code_change_review_dismissal_restrictions" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'restricts_review_dismissals')::bool = true then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then ' branch protection rule unknown.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'restricts_review_dismissals')::bool = true then ' has code change review dismissal restrictions.'
        else ' does not have code change review dismissal restrictions.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "default_branch_must_dismiss_stale_approvals" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'dismisses_stale_reviews') = 'true'  then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then ' branch protection rule unknown.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'dismisses_stale_reviews') = 'true' then ' stale reviews are dismissed.'
        else ' stale reviews are not dismissed.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "default_branch_pipeline_locks_external_dependencies_for_build_process" {
  sql = <<-EOQ
    with repositories as (
      select
        name_with_owner,
        url
      from
        github_my_repository
      order by
        name_with_owner
    ),
    pipelines as (
      select
        name,
        repository_full_name,
        pipeline
      from
        github_workflow
      where
        repository_full_name in (select name_with_owner from repositories)
    ),
    unpinned_task_count as (
      select
        count(*) filter (where step ->> 'type' = 'task' and (step -> 'task' ->> 'version_type')::text != 'commit' ) as unpinned_task_count,
        count(*) filter (where step ->> 'type' = 'task' and (step -> 'task' ->> 'version_type')::text = 'commit' ) as pinned_task_count,
        p.repository_full_name
      from
        pipelines as p,
        jsonb_array_elements(pipeline -> 'jobs') as job,
        jsonb_array_elements(job -> 'steps') as step
      group by
        repository_full_name
    )
    select
      -- Required Columns
      r.url as resource,
      case
        when u.unpinned_task_count > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when u.unpinned_task_count > 0 then unpinned_task_count::text || ' task(s) are not pinned.'
        when u.repository_full_name is null then 'No build task(s) in the repository.'
        else 'All task(s) are pinned.'
      end as reason,
      -- Additional Dimensions
      r.name_with_owner
    from
      repositories as r
      left join unpinned_task_count as u on r.name_with_owner = u.repository_full_name;
  EOQ
}

query "default_branch_pipeline_must_have_jobs_with_sbom_generation" {
  sql = <<-EOQ
    with repositories as (
      select
        name_with_owner,
        url
      from
        github_my_repository
      order by
        name_with_owner
    ),
    pipelines as (
      select
        name,
        repository_full_name,
        pipeline
      from
        github_workflow
      where
        repository_full_name in (select name_with_owner from repositories)
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
      -- Required Columns
      r.url as resource,
      case
        when ps.pipeline_without_sbom_jobs > 0 then 'alarm'
        when ps.repository_full_name is null then 'info'
        else 'ok'
      end as status,
      case
        when ps.pipeline_without_sbom_jobs > 0 then ps.pipeline_without_sbom_jobs::text || ' pipeline(s) contain a build job without SBOM generation.'
        when ps.repository_full_name is null then 'No pipelines available in the repository.'
        else 'All pipeline(s) contain a build job with SBOM generation.'
      end as reason,
      -- Additional Dimensions
      r.name_with_owner
    from
      repositories as r
      left join pipeline_with_sbom_job_details as ps on r.name_with_owner = ps.repository_full_name;
  EOQ
}

query "default_branch_pipelines_scan_for_vulnerabilities" {
  sql = <<-EOQ
    with repositories as (
      select
        name_with_owner,
        url
      from
        github_my_repository
      order by
        name_with_owner
    ),
    pipelines as (
      select
        name,
        repository_full_name,
        pipeline
      from
        github_workflow
      where
        repository_full_name in (select name_with_owner from repositories)
    ),
    vulnerability_task_repos as (
      select distinct
        p.repository_full_name
      from
        pipelines as p,
        jsonb_array_elements(pipeline -> 'jobs') as job,
        jsonb_array_elements(job -> 'steps') as step
      where
        step ->> 'type' = 'task'
        and (step -> 'task' ->> 'name')::text in (
          'argonsecurity/scanner-action',
          'aquasecurity/trivy-action'
        )
    )
    select
      -- Required Columns
      r.url as resource,
      case
        when v.repository_full_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when v.repository_full_name is null then 'Automated vulnerabilities scanning is not set for pipelines.'
        else 'Automated vulnerabilities scanning is set for pipelines.'
      end as reason,
      -- Additional Dimensions
      r.name_with_owner
    from
      repositories as r
      left join vulnerability_task_repos as v on r.name_with_owner = v.repository_full_name;
  EOQ
}

query "default_branch_pipelines_scanners_set_to_prevent_sensitive_data" {
  sql = <<-EOQ
    with repositories as (
      select
        name_with_owner,
        url
      from
        github_my_repository
      order by
        name_with_owner
    ),
    pipelines as (
      select
        name,
        repository_full_name,
        pipeline
      from
        github_workflow
      where
        repository_full_name in (select name_with_owner from repositories)
    ),
    vulnerability_scanner_repos as (
      select distinct
        p.repository_full_name
      from
        pipelines as p,
        jsonb_array_elements(pipeline -> 'jobs') as job,
        jsonb_array_elements(job -> 'steps') as step
      where
        (step ->> 'type' = 'task'
        and (step -> 'task' ->> 'name')::text in (
          'argonsecurity/scanner-action',
          'aquasecurity/trivy-action',
          'zricethezav/gitleaks-action',
          'ShiftLeftSecurity/scan-action'
        )) or
        (step ->> 'type' = 'shell'
        and ((step -> 'shell' ->> 'script')::text like glob('spectral.* scan') or
          (step -> 'shell' ->> 'script')::text like glob('git secrets --scan') or
          (step -> 'shell' ->> 'script')::text like glob('whispers') or
          (step -> 'shell' ->> 'script')::text like glob('docker run.* abhartiya/tools_gitallsecrets') or
          (step -> 'shell' ->> 'script')::text like glob('detect-secrets.* scan')
        ))
    )
    select
      -- Required Columns
      r.url as resource,
      case
        when v.repository_full_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when v.repository_full_name is null then 'Scanners are not set to identify and prevent sensitive data in pipeline files.'
        else 'Scanners are set to identify and prevent sensitive data in pipeline files.'
      end as reason,
      -- Additional Dimensions
      r.name_with_owner
    from
      repositories as r
      left join vulnerability_scanner_repos as v on r.name_with_owner = v.repository_full_name;
  EOQ
}

query "default_branch_protections_apply_to_admins" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'is_admin_enforced') = 'true' then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
        case
          when (default_branch_ref -> 'branch_protection_rule' ->> 'is_admin_enforced') = 'true' then ' protections apply to admins.'
          when (default_branch_ref -> 'branch_protection_rule' ->> 'is_admin_enforced') = 'false' then ' protections do not apply to admins.'
          -- If not false or true, then null, which means no branch protection rule exists
          else ' branch protection rule unknown.'
        end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "default_branch_requires_2_pull_request_reviews" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'required_approving_review_count')::integer >= 2 then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then ' branch protection rule unknown.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'required_approving_review_count')::integer >= 2 then ' has at least two pull request reviews.'
        else ' does not have at least two pull request reviews.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "default_branch_requires_code_owners_review" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_code_owner_reviews')::bool is true then 'ok'
        else 'alarm'
      end as status,
        name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then ' branch protection rule unknown.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_code_owner_reviews')::bool is true then ' enforces code owner''s review.'
        else ' does not enforce code owner''s review.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "default_branch_requires_signed_commits" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_commit_signatures')::bool = true then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then ' branch protection rule unknown.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_commit_signatures')::bool = true then ' requires signed commits before merge.'
        else ' does not require signed commits before merge.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "default_branch_requires_status_checks" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_status_checks')::bool = true then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule') is not null then ' branch protection status unknown.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_status_checks')::bool = true then ' requires status checks.'
        else ' does not require status checks.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "default_branch_restrict_push_and_merge" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'restricts_pushes')::bool = true  then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule') is not null then ' branch protection rule unknown.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'restricts_pushes')::bool = true then ' has restrictions for code push and merge.'
        else ' has no restrictions for code push and merge.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "default_branch_setting_block_deletion" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_deletions') = 'false' then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_deletions') = 'false' then ' prevents deletions.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'allows_deletions') = 'true' then ' allows deletions.'
        -- If not false or true, then null, which means no branch protection rule exists
        else ' branch protection rule unknown.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}
