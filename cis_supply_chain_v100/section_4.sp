locals {
  cis_supply_chain_v100_4_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "4"
  })
}

locals {
  cis_supply_chain_v100_4_2_common_tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    cis_section_id = "4.2"
  })
}

locals {
  cis_supply_chain_v100_4_3_common_tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    cis_section_id = "4.3"
  })
}

benchmark "cis_supply_chain_v100_4" {
  title         = "4 Artifacts"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4.md")
  children = [
    benchmark.cis_supply_chain_v100_4_2,
    benchmark.cis_supply_chain_v100_4_3
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_4_2" {
  title         = "4.2 Access to Artifacts"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2.md")
  children = [
    control.cis_supply_chain_v100_4_2_3
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

benchmark "cis_supply_chain_v100_4_3" {
  title         = "4.3 Package Registries"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_3.md")
  children = [
    control.cis_supply_chain_v100_4_3_4
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_4_3_4" {
  title         = "4.3.4 Ensure webhooks of the package registry are secured"
  description   = "Use secured webhooks of the package registry."
  sql           = query.repo_webhook_package_registery_security_settings_enabled.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_3_4.md")

  param "repo_pattern" {
    description = "A regex to match github_my_repository.full_name."
    default     = var.repo_pattern
  }
  
  tags = merge(local.cis_supply_chain_v100_4_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}
