benchmark "cis_supply_chain_v100_1_5" {
  title = "1.5 Code Risks"
  # documentation = file("./cis_v130/docs/cis_v130_4.md")
  children = [
    control.cis_supply_chain_v100_1_5_1,
    control.cis_supply_chain_v100_1_5_2,
    control.cis_supply_chain_v100_1_5_3,
    control.cis_supply_chain_v100_1_5_4,
    control.cis_supply_chain_v100_1_5_5,
    control.cis_supply_chain_v100_1_5_6
  ]

  tags = merge(local.cis_supply_chain_v100_1_5_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_1_5_1" {
  title       = "1.5.1 Ensure scanners are in place to identify and prevent sensitive data in code"
  description = "Detect and prevent sensitive data in code, such as confidential ID numbers, passwords, etc."
  sql         = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_5_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_5_2" {
  title       = "1.5.2 Ensure scanners are in place to secure Continuous Integration (CI) pipeline instructions"
  description = "Detect and prevent misconfigurations and insecure instructions in Continuous Integration (CI) pipelines."
  sql         = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_5_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_5_3" {
  title       = "1.5.3 Ensure scanners are in place to secure Infrastructure as Code (IaC) instructions"
  description = "Detect and prevent misconfigurations or insecure instructions in Infrastructure as Code (IaC) files, such as Terraform files."
  sql         = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_5_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_5_4" {
  title       = "1.5.4 Ensure scanners are in place for code vulnerabilities"
  description = "Detect and prevent known open-source vulnerabilities in the code."
  sql         = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_5_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_5_5" {
  title       = "1.5.5 Ensure scanners are in place for open-source vulnerabilities in used packages"
  description = "Detect, prevent and monitor known open-source vulnerabilities in packages that are being used."
  sql         = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_5_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_5_6" {
  title       = "1.5.6 Ensure scanners are in place for open-source license issues in used packages"
  description = "Detect open-source license problems in used dependencies and fix them."
  sql         = query.repo_manual_control.sql

  tags = merge(local.cis_supply_chain_v100_1_5_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}
