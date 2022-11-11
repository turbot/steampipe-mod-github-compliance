locals {
  other_common_tags = merge(local.github_compliance_common_tags, {
    other_checks = "true"
  })
}

benchmark "other" {
  title         = "Other Compliance Checks"
  documentation = file("./other_checks/docs/other_checks_overview.md")
  children = [
    control.organization_base_permissions_none,
  ]

  tags = merge(local.other_common_tags, {
    type = "Benchmark"
  })
}

control "organization_base_permissions_none" {
  title       = "Organization base permissions should be set to None"
  description = "Organization base permissions should be set to None to force explicit access grants to users to repositories."
  sql         = query.org_default_repo_permission_none.sql

  tags = local.other_common_tags
}
