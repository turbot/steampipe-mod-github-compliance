---
repository: "https://github.com/turbot/steampipe-mod-github-compliance"
---

# GitHub Compliance Mod

Run security controls across all your GitHub organizations and repositories to look for branch protection rules, organization member privileges, security settings, and more.

<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-github-compliance/main/docs/images/github_compliance_cis_v100_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-github-compliance/main/docs/images/github_compliance_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-github-compliance/main/docs/images/github_compliance_benchmark.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-github-compliance/main/docs/images/github_cis_v100_terminal.png" width="50%" type="thumbnail"/>

## References

[GitHub](https://github.com/) is a provider of Internet hosting for software development and version control using Git.

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Steampipe Mods](https://steampipe.io/docs/reference/mod-resources#mod) are collections of `named queries`, and codified `controls` that can be used to test current configuration of your cloud resources against a desired configuration.

## Documentation

- **[Benchmarks and controls →](https://hub.steampipe.io/mods/turbot/github_compliance/controls)**
- **[Named queries →](https://hub.steampipe.io/mods/turbot/github_compliance/queries)**

## Getting started

### Installation

Download and install Steampipe (https://steampipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install steampipe
```

Install the GitHub plugin with [Steampipe](https://steampipe.io):

```sh
steampipe plugin install github
```

Clone:

```sh
git clone https://github.com/turbot/steampipe-mod-github-compliance.git
cd steampipe-mod-github-compliance
```

### Usage

Start your dashboard server to get started:

```sh
steampipe dashboard
```

By default, the dashboard interface will then be launched in a new browser
window at http://localhost:9194. From here, you can run benchmarks by
selecting one or searching for a specific one.

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `steampipe check` command:

Run all benchmarks:

```sh
steampipe check all
```

Run a single benchmark:

```sh
steampipe check benchmark.cis_supply_chain_v100
```

Run a specific control:

```sh
steampipe check control.cis_supply_chain_v100_1_1_3
```

Different output formats are also available, for more information please see
[Output Formats](https://steampipe.io/docs/reference/cli/check#output-formats).

### Credentials

This mod uses the credentials configured in the [Steampipe GitHub plugin](https://hub.steampipe.io/plugins/turbot/github).

### Configuration

Few benchmarks have [input variables](https://steampipe.io/docs/using-steampipe/mod-variables) that can be configured to better match your environment and requirements. Each variable has a default defined in its source file, e.g., `cis_supply_chain_v100/section_1.sp`, but these can be overwritten in several ways:

- Copy and rename the `steampipe.spvars.example` file to `steampipe.spvars`, and then modify the variable values inside that file
- Pass in a value on the command line:

  ```shell
  steampipe check control.cis_supply_chain_v100_1_2_3 --var='trusted_repo_admins=["user_1", "user_2"]'
  ```

- Set an environment variable:

  ```shell
  SP_VAR_trusted_repo_admins='["user_1", "user_2"]' steampipe check control.cis_supply_chain_v100_1_2_3
  ```

  - Note: When using environment variables, if the variable is defined in `steampipe.spvars` or passed in through the command line, either of those will take precedence over the environment variable value. For more information on variable definition precedence, please see the link below.

These are only some of the ways you can set variables. For a full list, please see [Passing Input Variables](https://steampipe.io/docs/using-steampipe/mod-variables#passing-input-variables).

## Contributing

If you have an idea for additional controls or just want to help maintain and extend this mod ([or others](https://github.com/topics/steampipe-mod)) we would love you to join the community and start contributing.

- **[Join #steampipe on Slack → →](https://turbot.com/community/join)** and hang out with other Mod developers.

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-github-compliance/blob/main/LICENSE).

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [GitHub Compliance Mod](https://github.com/turbot/steampipe-mod-github-compliance/labels/help%20wanted)
