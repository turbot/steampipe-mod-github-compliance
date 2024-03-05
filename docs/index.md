# GitHub Compliance Mod

Run security controls across all your GitHub organizations and repositories to look for branch protection rules, organization member privileges, security settings, and more.

<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-github-compliance/add-new-checks/docs/images/github_compliance_dashboard_cis.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-github-compliance/add-new-checks/docs/images/github_compliance_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-github-compliance/add-new-checks/docs/images/github_compliance_cis_benchmark_dashbopard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-github-compliance/add-new-checks/docs/images/github_compliance_console.png" width="50%" type="thumbnail"/>


## Documentation

- **[Benchmarks and controls →](https://hub-powerpipe-io-git-development-turbot.vercel.app/mods/turbot/github_compliance/controls)**
- **[Named queries →](https://hub-powerpipe-io-git-development-turbot.vercel.app/mods/turbot/github_compliance/queries)**

## Getting started

### Installation

Install Powerpipe (https://powerpipe.io/downloads), or use Brew:

```sh
brew install turbot/tap/powerpipe
```

This mod also requires [Steampipe](https://steampipe.io) with the [Github plugin](https://hub.steampipe.io/plugins/turbot/github) as the data source. Install Steampipe (https://steampipe.io/downloads), or use Brew:

```sh
brew install turbot/tap/steampipe
steampipe plugin install github
```

This mod uses the credentials configured in the [GitHub plugin credential](https://hub.steampipe.io/plugins/turbot/github#credentials).

Finally, install the mod:

```sh
mkdir dashboards
cd dashboards
powerpipe mod init
powerpipe mod install github.com/turbot/steampipe-mod-github-compliance
```

### Browsing Dashboards

Start Steampipe as the data source:

```sh
steampipe service start
```

Start the dashboard server:

```sh
powerpipe server
```

Browse and view your dashboards at **http://localhost:9033**.

### Running Checks in Your Terminal

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `powerpipe benchmark` command:

List available benchmarks:

```sh
powerpipe benchmark list
```

Run a benchmark:

```sh
powerpipe benchmark run github_compliance.benchmark.cis_supply_chain_v100
```

Different output formats are also available, for more information please see
[Output Formats](https://powerpipe.io/docs/reference/cli/benchmark#output-formats).

### Common and Tag Dimensions

The benchmark queries use common properties and tags that are defined in the form of a default list of strings in the `variables.sp` file. These properties can be overwritten in several ways:

It's easiest to setup your vars file, starting with the sample:

```sh
cp powerpipe.ppvar.example powerpipe.ppvars
vi powerpipe.ppvars
```

Alternatively you can pass variables on the command line:

```sh
powerpipe benchmark run github_compliance.benchmark.cis_supply_chain_v100 --var 'trusted_repo_admins=["user_1", "user_2"]'
```

Or through environment variables:

```sh
export PP_VAR_trusted_repo_admins='["user_1", "user_2"]'
powerpipe benchmark run github_compliance.benchmark.cis_supply_chain_v100
```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Steampipe](https://steampipe.io) and [Powerpipe](https://powerpipe.io) are products produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). They are distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #powerpipe on Slack →](https://turbot.com/community/join)**

Want to help but don't know where to start? Pick up one of the `help wanted` issues:

- [Powerpipe](https://github.com/turbot/powerpipe/labels/help%20wanted)
- [GitHub Compliance Mod](https://github.com/turbot/steampipe-mod-github-compliance/labels/help%20wanted)
