## v0.2 [2022-11-10]

_What's new?_

- Added Other Compliance Checks benchmark (`steampipe check benchmark.other`). ([#19](https://github.com/turbot/steampipe-mod-github-compliance/pull/19))

_Enhancements_

- Updated `repo_inactive_members_review` query to only check commits from last 30 days. ([#20](https://github.com/turbot/steampipe-mod-github-compliance/pull/20))

_Bug fixes_

- Fixed `org_two_factor_required` query returning false positives if the authenticated user not an owner of the organization. ([#16](https://github.com/turbot/steampipe-mod-github-compliance/pull/16))
- Fixed broken links in index document. ([#12](https://github.com/turbot/steampipe-mod-github-compliance/pull/12))

## v0.1 [2022-08-18]

_What's new?_

- Added CIS Software Supply Chain v1.0.0 benchmark (`steampipe check benchmark.cis_supply_chain_v100`). ([#4](https://github.com/turbot/steampipe-mod-github-compliance/pull/4))
