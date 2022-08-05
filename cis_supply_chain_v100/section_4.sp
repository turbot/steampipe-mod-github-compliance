locals {
  cis_supply_chain_v100_4_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "4"
  })
}

locals {
  cis_supply_chain_v100_4_2_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "4.2"
  })
}

benchmark "cis_supply_chain_v100_4" {
  title         = "4 Artifacts"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4.md")
  children = [
    benchmark.cis_supply_chain_v100_4_2
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_4_2" {
  title         = "4.2 Access to Artifacts"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2.md")
  children = [
    control.cis_supply_chain_v100_4_2_3,
    control.cis_supply_chain_v100_4_2_5
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_4_2_3" {
  title         = "4.2.3 Ensure user access to the package registry utilizes Multi-Factor Authentication (MFA)"
  description   = "Enforce Multi-Factor Authentication (MFA) for user access to the package registry."
  sql           = query.org_two_factor_required.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2_3.md")

  tags = merge(local.cis_supply_chain_v100_4_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_4_2_5" {
  title         = "4.2.5 Ensure anonymous access to artifacts is revoked"
  description   = "Disable anonymous access to artifacts."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2_5.md")

  tags = merge(local.cis_supply_chain_v100_4_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}