locals {
  other_common_tags = merge(local.github_compliance_common_tags, {
    other_checks = "true"
  })
}

benchmark "other" {
  title         = "Other Compliance Checks"
  documentation = file("./other_checks/docs/other_checks_overview.md")
  children = [
    control.org_two_factor_required,
  ]

  tags = merge(local.other_common_tags, {
    type = "Benchmark"
  })
}

control "org_two_factor_required" {
  title       = "Ensure the organization is requiring members to use Multi-Factor Authentication (MFA)"
  description = "Require members of the organization to use Multi-Factor Authentication (MFA) in addition to a standard user name and password when authenticating to the source code management platform."
  sql         = query.org_two_factor_required.sql

  tags = local.other_common_tags
}
