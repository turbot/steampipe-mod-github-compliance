benchmark "cis_supply_chain_v100_1_3" {
  title = "1.3 Contribution Access"
  # documentation = file("./cis_v130/docs/cis_v130_4.md")
  children = [
    control.cis_supply_chain_v100_1_3_1,
    control.cis_supply_chain_v100_1_3_2,
    control.cis_supply_chain_v100_1_3_3,
    control.cis_supply_chain_v100_1_3_4,
    control.cis_supply_chain_v100_1_3_5,
    control.cis_supply_chain_v100_1_3_6,
    control.cis_supply_chain_v100_1_3_7,
    control.cis_supply_chain_v100_1_3_8,
    control.cis_supply_chain_v100_1_3_9,
    control.cis_supply_chain_v100_1_3_10,
    control.cis_supply_chain_v100_1_3_11,
    control.cis_supply_chain_v100_1_3_12,
    control.cis_supply_chain_v100_1_3_13
  ]

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_1_3_1" {
  title       = "1.3.1 Ensure inactive users are reviewed and removed periodically"
  description = "Track inactive user accounts and periodically remove them."
  sql         = query.org_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_3_2" {
  title       = "1.3.2 Ensure team creation is limited to specific members"
  description = "Limit the ability to create teams to trusted and specific users."
  sql         = query.org_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_3_3" {
  title       = "1.3.3 Ensure minimum number of administrators are set for the organization"
  description = "Ensure the organization has a minimum number of administrators."
  sql         = query.org_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })

}

control "cis_supply_chain_v100_1_3_4" {
  title       = "1.3.4 Ensure Multi-Factor Authentication (MFA) is required for contributors of new code"
  description = "Require collaborators from outside the organization to use Multi-Factor Authentication (MFA) in addition to a standard user name and password when authenticating to the source code management platform."
  sql         = query.org_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_3_5" {
  title       = "1.3.5 Ensure the organization is requiring members to use Multi-Factor Authentication (MFA)"
  description = "Require members of the organization to use Multi-Factor Authentication (MFA) in addition to a standard user name and password when authenticating to the source code management platform."
  sql         = query.org_two_factor_required.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })

}

control "cis_supply_chain_v100_1_3_6" {
  title       = "1.3.6 Ensure new members are required to be invited using company-approved email"
  description = "Existing members of an organization can invite new members to join; however, new members must only be invited with their company-approved email."
  sql         = query.org_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_3_7" {
  title       = "1.3.7 Ensure two administrators are set for each repository"
  description = "Ensure every repository has two users with administrative permissions."
  sql         = query.repo_should_have_two_admins.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })

}

control "cis_supply_chain_v100_1_3_8" {
  title       = "1.3.8 Ensure strict base permissions are set for repositories"
  description = "Base permissions define the permission level automatically granted to all organization members. Define strict base access permissions for all of the repositories in the organization, including new ones."
  sql         = query.org_strict_default_permission.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })

}

control "cis_supply_chain_v100_1_3_9" {
  title       = "1.3.9 Ensure an organization's identity is confirmed with a 'Verified' badge"
  description = "Confirm the domains an organization owns with a 'Verified' badge."
  sql         = query.org_domain_verified.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })

}

control "cis_supply_chain_v100_1_3_10" {
  title       = "1.3.10 Ensure Source Code Management (SCM) email notifications are restricted to verified domains"
  description = "Restrict the organization's Source Code Management (SCM) email notifications to approved domains only."
  sql         = query.org_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_3_11" {
  title       = "1.3.11 Ensure an organization provides SSH certificates"
  description = "As an organization, become an SSH Certificate Authority (CA) and provide SSH keys for accessing repositories."
  sql         = query.org_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_3_12" {
  title       = "1.3.12 Ensure Git access is limited based on IP addresses"
  description = "Limit Git access based on IP addresses by having an allowlist of IP addresses from which connection is possible."
  sql         = query.org_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_3_13" {
  title       = "1.3.13 Ensure anomalous code behavior is tracked"
  description = "Track code anomalies."
  sql         = query.org_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}
