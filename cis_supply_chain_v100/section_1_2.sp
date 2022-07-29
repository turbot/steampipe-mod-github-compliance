benchmark "cis_supply_chain_v100_1_2" {
  title = "1.2 Repository Management"
  # documentation = file("./cis_v130/docs/cis_v130_4.md")
  children = [
    control.cis_supply_chain_v100_1_2_1,
    control.cis_supply_chain_v100_1_2_2,
    control.cis_supply_chain_v100_1_2_3,
    control.cis_supply_chain_v100_1_2_4,
    control.cis_supply_chain_v100_1_2_5,
    control.cis_supply_chain_v100_1_2_6,
    control.cis_supply_chain_v100_1_2_7
  ]

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_1_2_1" {
  title       = "1.2.1 Ensure all public repositories contain a SECURITY.md file"
  description = "A SECURITY.md file is a security policy file that offers instruction on reporting security vulnerabilities in a project. When someone creates an issue within a specific project, a link to the SECURITY.md file will subsequently be shown."
  # sql         = query.public_repo_security_added.sql
  sql = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })

}

control "cis_supply_chain_v100_1_2_2" {
  title       = "1.2.2 Ensure repository creation is limited to specific members"
  description = "Limit the ability to create repositories to trusted users and teams."
  sql         = query.org_members_cannot_create_repos.sql

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })

}

control "cis_supply_chain_v100_1_2_3" {
  title       = "1.2.3 Ensure repository deletion is limited to specific users"
  description = "Ensure only a limited number of trusted users can delete repositories."
  sql         = query.repo_deletion_limited_to_3_users.sql

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })

}

control "cis_supply_chain_v100_1_2_4" {
  title       = "1.2.4 Ensure issue deletion is limited to specific users"
  description = "Ensure only trusted and responsible users can delete issues."
  sql         = query.repo_issue_deletion_limited_to_3_users.sql

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })

}

control "cis_supply_chain_v100_1_2_5" {
  title       = "1.2.5 Ensure all copies (forks) of code are tracked and accounted for"
  description = "Track every fork of code and ensure it is accounted for."
  sql         = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_2_6" {
  title       = "1.2.6 Ensure all code projects are tracked for changes in visibility status"
  description = "Ensure every change in visibility of projects is tracked."
  sql         = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_2_7" {
  title       = "1.2.7 Ensure inactive repositories are reviewed and archived periodically"
  description = "Track inactive repositories and remove them periodically."
  sql         = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}
