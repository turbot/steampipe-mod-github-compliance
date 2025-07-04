## v1.1.1 [2025-07-04]

_Bug fixes_

- Fixed `repo_deletion_limited_to_trusted_users` and `repo_issue_deletion_limited_to_trusted_users` queries to correctly return data instead of an error. ([#56](https://github.com/turbot/steampipe-mod-github-compliance/pull/56))

## v1.1.0 [2025-04-15]

_Enhancements_

- Added service tags such as `GitHub/Organization`, `GitHub/Repository`, and others to relevant controls for improved organization and filtering. ([#53](https://github.com/turbot/steampipe-mod-github-compliance/pull/53))

## v1.0.1 [2024-10-24]

_Bug fixes_

- Renamed `steampipe.spvars.example` files to `powerpipe.ppvars.example` and updated documentation. ([#51](https://github.com/turbot/steampipe-mod-github-compliance/pull/51))

## v1.0.0 [2024-10-22]

This mod now requires [Powerpipe](https://powerpipe.io). [Steampipe](https://steampipe.io) users should check the [migration guide](https://powerpipe.io/blog/migrating-from-steampipe).

## v0.7 [2024-03-06]

_Powerpipe_

[Powerpipe](https://powerpipe.io) is now the preferred way to run this mod!  [Migrating from Steampipe →](https://powerpipe.io/blog/migrating-from-steampipe)

All v0.x versions of this mod will work in both Steampipe and Powerpipe, but v1.0.0 onwards will be in Powerpipe format only.

_Enhancements_

- Focus documentation on Powerpipe commands.
- Show how to combine Powerpipe mods with Steampipe plugins.

## v0.6 [2023-11-03]

_Breaking changes_

- Updated the plugin dependency section of the mod to use `min_version` instead of `version`. ([#42](https://github.com/turbot/steampipe-mod-github-compliance/pull/42))

## v0.5 [2023-10-03]

_Enhancements_

- Updated the following queries to use `url` as the resource column: ([#35](https://github.com/turbot/steampipe-mod-github-compliance/pull/35))
  - `default_branch_all_build_steps_as_code`
  - `default_branch_pipeline_locks_external_dependencies_for_build_process`
  - `default_branch_pipeline_must_have_jobs_with_sbom_generation`
  - `default_branch_pipelines_scan_for_vulnerabilities`
  - `default_branch_pipelines_scanners_set_to_prevent_sensitive_data`
  - `org_member_mfa_enabled`
  - `repo_inactive_members_review`
  - `repo_deletion_limited_to_trusted_users`
  - `repo_issue_deletion_limited_to_trusted_users`
  - `repo_webhook_package_registery_security_settings_enabled`

## v0.4 [2023-06-21]

_What's new?_

- All queries have been updated to work with GitHub plugin v0.28.0, which includes a large number of breaking changes as 25+ tables have been updated to use GitHub's GraphQL API. For more information, please see the plugin's [v0.28.0 release notes](https://github.com/turbot/steampipe-plugin-github/blob/main/CHANGELOG.md#v0280-2023-06-21).

_Dependencies_

- GitHub plugin `v0.28.0` or higher is now required.

## v0.3 [2022-11-15]

_What's new?_

- Added the following new controls to the Other Compliance Checks benchmark: ([#24](https://github.com/turbot/steampipe-mod-github-compliance/pull/24))
  - `organization_member_mfa_enabled`

_Bug fixes_

- Fixed `org_default_repo_permission_none` and `org_default_repo_permission_none_read` queries returning false positives if the authenticated user is not an owner of the organization. ([#23](https://github.com/turbot/steampipe-mod-github-compliance/pull/23))

## v0.2 [2022-11-10]

_What's new?_

- Added Other Compliance Checks benchmark (`steampipe check benchmark.other`). ([#19](https://github.com/turbot/steampipe-mod-github-compliance/pull/19))

_Enhancements_

- Updated `repo_inactive_members_review` query to only check commits from last 30 days. ([#20](https://github.com/turbot/steampipe-mod-github-compliance/pull/20))

_Bug fixes_

- Fixed `org_two_factor_required` query returning false positives if the authenticated user is not an owner of the organization. ([#16](https://github.com/turbot/steampipe-mod-github-compliance/pull/16))
- Fixed broken links in index document. ([#12](https://github.com/turbot/steampipe-mod-github-compliance/pull/12))

## v0.1 [2022-08-18]

_What's new?_

- Added CIS Software Supply Chain v1.0.0 benchmark (`steampipe check benchmark.cis_supply_chain_v100`). ([#4](https://github.com/turbot/steampipe-mod-github-compliance/pull/4))
