query "org_default_repo_permission_none_read" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when default_repo_permission is null then 'info'
        when default_repo_permission in ('read', 'none') then 'ok'
        else 'alarm'
      end as status,
      login || case
        when default_repo_permission is null then ' base permission unknown, manual verification required.'
        else ' base permission is ' || default_repo_permission || '.'
      end as reason,
      -- Additional Dimensions
      login
    from
      github_my_organization;
  EOQ
}

query "org_default_repo_permission_none" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when default_repo_permission is null then 'info'
        when default_repo_permission = 'none' then 'ok'
        else 'alarm'
      end as status,
      login || case
        when default_repo_permission is null then ' base permission unknown, manual verification required.'
        else ' base permission is ' || default_repo_permission || '.'
      end as reason,
      -- Additional Dimensions
      login
    from
      github_my_organization;
  EOQ
}

query "org_domain_verified" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when is_verified then 'ok'
        else 'alarm'
      end as status,
      coalesce(name, login) || ' domain is ' || case when (is_verified)::bool then 'verified' else 'not verified' end || '.' as reason,
      -- Additional Dimensions
      login
    from
      github_my_organization;
  EOQ
}

query "org_member_mfa_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      m.url as resource,
      case
        when m.has_two_factor_enabled is null then 'info'
        when m.has_two_factor_enabled then 'ok'
        else 'alarm'
      end as status,
      m.login || case
        when m.has_two_factor_enabled is null then ' MFA status unknown. Manual verification required.'
        when m.has_two_factor_enabled then ' MFA enabled.'
        else ' MFA not enabled.'
      end as reason,
      -- Additional Dimensions
      m.organization
    from
      github_organization_member m
      join github_my_organization o on m.organization = o.login;
  EOQ
}

query "org_members_cannot_create_repos" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when members_can_create_public_repos or members_can_create_private_repos then 'alarm'
        else 'ok'
      end as status,
      login || ' users ' || case when (members_can_create_public_repos)::bool or (members_can_create_private_repos)::bool then 'can ' else 'cannot ' end || 'create repositories.' as reason,
      -- Additional Dimensions
      login
    from
      github_my_organization;
  EOQ
}

query "org_minimum_administrators_set" {
  sql = <<-EOQ
    select
      -- Required Columns
      o.url as resource,
      case
        when count(m.login) < 2 then 'alarm'
        else 'ok'
      end as status,
      case
        when count(m.login) < 2 then m.organization || ' has less than 2 admins.'
        else m.organization || ' has minimum required admins.'
      end as reason,
      -- Additional Dimensions
      m.organization
    from
      github_organization_member m
      join github_my_organization o on m.organization = o.login
    where
      role = 'ADMIN'
    group by
      role,
      m.organization,
      o.url;
  EOQ
}

query "org_two_factor_required" {
  sql = <<-EOQ
    select
      -- Required Columns
      url as resource,
      case
        when two_factor_requirement_enabled is null then 'info' -- info is only available to owners
        when two_factor_requirement_enabled then 'ok'
        else 'alarm'
      end as status,
      coalesce(name, login) || case
        when (two_factor_requirement_enabled)::bool is null then ' two-factor authentication unknown, manual verification required'
        when (two_factor_requirement_enabled)::bool then ' requires two-factor authentication'
        else ' does not require two-factor authentication' end || '.' as reason,
      -- Additional Dimensions
      login
    from
      github_my_organization;
  EOQ
}

query "repo_inactive_members_review" {
  sql = <<-EOQ
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
        name_with_owner as repository_full_name,
        url
      from
        github_my_repository
        join github_repository_collaborator c on c.repository_full_name = name_with_owner
    )
    select
      -- Required Columns
      l.url as resource,
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
  EOQ
}
