query "public_repo_has_security_md_file" {
  sql = <<-EOQ
    select
      -- Required Columns
      r.url as resource,
      case
        when p.security is null then 'alarm'
        else 'ok'
      end as status,
      r.name_with_owner || case when(p.security is not null) then ' with ' else ' without ' end || 'SECURITY.md file.' as reason,
      -- Additional Dimensions
      r.name_with_owner
    from
      github_my_repository as r
      left join github_community_profile as p on r.name_with_owner = p.repository_full_name
    where
      visibility = 'PUBLIC' and r.is_fork = false;
  EOQ
}

query "repo_delete_branch_on_merge_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when delete_branch_on_merge then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' delete branch on merge is ' || case when(delete_branch_on_merge)::bool then 'enabled' else 'disabled' end || '.' as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "repo_inactive_more_than_90_days" {
  sql = <<-EOQ
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
  EOQ
}

query "repo_linear_history_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when ((default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'requires_linear_history')::bool = true) or (rebase_merge_allowed = true or squash_merge_allowed = true) then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') || case when((default_branch_ref -> 'branch_protection_rule') is not null and (default_branch_ref -> 'branch_protection_rule' ->> 'requires_linear_history')::bool = true) or (rebase_merge_allowed = true or squash_merge_allowed = true) then ' has linear history enabled.' else ' has linear history disabled.' end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "repo_no_open_comments" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_conversation_resolution')::bool = true then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then ' branch protection rule unknown.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_conversation_resolution')::bool = true then ' requires conversation resolution before merge.'
        else ' does not require conversation resolution before merge.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "repo_open_branches_are_upto_date_before_merge" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then 'info'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_strict_status_checks')::bool = true then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || ' default branch ' || (default_branch_ref ->> 'name') ||
      case
        when (default_branch_ref -> 'branch_protection_rule') is null then ' branch protection rule unknown.'
        when (default_branch_ref -> 'branch_protection_rule' ->> 'requires_strict_status_checks')::bool = true then ' requires open branches to be upto date before merge.'
        else ' does not require open branches to be upto date before merge.'
      end as reason,
      -- Additional Dimensions
      name_with_owner
    from
      github_my_repository;
  EOQ
}

query "repo_should_have_two_admins" {
  sql = <<-EOQ
    with repo_admins as (
      select
        name_with_owner,
        url,
        count(user_login) as admins
      from github_my_repository r
      join github_repository_collaborator c
      on r.name_with_owner = c.repository_full_name
      and c.permission = 'ADMIN'
    group by name_with_owner, url
    )
    select
      url as resource,
      case
        when admins >= 2 then 'ok'
        else 'alarm'
      end as status,
      name_with_owner || case when admins >= 2 then ' has ' || admins::text || ' administrators.' else ' has only ' || admins::text || ' administrators.' end as reason,
      name_with_owner
    from repo_admins;
  EOQ
}

query "repo_webhook_package_registery_security_settings_enabled" {
  sql = <<-EOQ
    with hooks_info as (
      select
        login as name,
        url,
        h as hook
      from
        github_my_organization,
        jsonb_array_elements(hooks) h
      union
      select
        name,
        url,
        h as hook
      from
        github_my_repository,
        jsonb_array_elements(hooks) h
    )
    select
      -- Required Columns
      url as resource,
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
  EOQ
}
