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
