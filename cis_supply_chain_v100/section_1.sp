locals {
  cis_supply_chain_v100_1_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "1"
  })
}

locals {
  cis_supply_chain_v100_1_1_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.1"
  })
  cis_supply_chain_v100_1_2_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.2"
  })
  cis_supply_chain_v100_1_3_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.3"
  })
  cis_supply_chain_v100_1_4_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.4"
  })
  cis_supply_chain_v100_1_5_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.5"
  })
}

benchmark "cis_supply_chain_v100_1" {
  title         = "1 Source Code"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1.md")
  children = [
    benchmark.cis_supply_chain_v100_1_1,
    benchmark.cis_supply_chain_v100_1_2,
    benchmark.cis_supply_chain_v100_1_3,
    benchmark.cis_supply_chain_v100_1_4,
    benchmark.cis_supply_chain_v100_1_5
  ]

  tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    type = "Benchmark"
  })
}
