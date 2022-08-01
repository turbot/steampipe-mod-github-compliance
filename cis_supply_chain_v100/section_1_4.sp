benchmark "cis_supply_chain_v100_1_4" {
  title         = "1.4 Third-Party"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_4.md")
  children = [
    control.cis_supply_chain_v100_1_4_1,
    control.cis_supply_chain_v100_1_4_2,
    control.cis_supply_chain_v100_1_4_3
  ]

  tags = merge(local.cis_supply_chain_v100_1_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_1_4_1" {
  title         = "1.4.1 Ensure administrator approval is required for every installed application"
  description   = "Ensure an administrator approval is required when installing applications."
  sql           = query.org_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_4_1.md")

  tags = merge(local.cis_supply_chain_v100_1_4_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_4_2" {
  title         = "1.4.2 Ensure stale applications are reviewed and inactive ones are removed"
  description   = "Ensure stale (inactive) applications are reviewed and removed if no longer in use."
  sql           = query.org_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_4_2.md")

  tags = merge(local.cis_supply_chain_v100_1_4_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_4_3" {
  title         = "1.4.3 Ensure the access granted to each installed application is limited to the least privilege needed"
  description   = "Ensure installed application permissions are limited to the lowest privilege level required."
  sql           = query.org_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_4_3.md")

  tags = merge(local.cis_supply_chain_v100_1_4_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}
