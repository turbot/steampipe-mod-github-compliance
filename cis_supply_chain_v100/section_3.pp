locals {
  cis_supply_chain_v100_3_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "3"
  })
}

locals {
  cis_supply_chain_v100_3_1_common_tags = merge(local.cis_supply_chain_v100_3_common_tags, {
    cis_section_id = "3.1"
  })
  cis_supply_chain_v100_3_2_common_tags = merge(local.cis_supply_chain_v100_3_common_tags, {
    cis_section_id = "3.2"
  })
}

benchmark "cis_supply_chain_v100_3" {
  title         = "3 Dependencies"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3.md")
  children = [
    benchmark.cis_supply_chain_v100_3_1,
    benchmark.cis_supply_chain_v100_3_2
  ]

  tags = merge(local.cis_supply_chain_v100_3_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_3_1" {
  title         = "3.1 Third-Party Packages"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1.md")
  children = [
    control.cis_supply_chain_v100_3_1_7
  ]

  tags = merge(local.cis_supply_chain_v100_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_3_1_7" {
  title         = "3.1.7 Ensure dependencies are pinned to a specific, verified version"
  description   = "Pin dependencies to a specific version. Avoid using the “latest” tag or broad version."
  query         = query.default_branch_pipeline_locks_external_dependencies_for_build_process
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1_7.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
    service               = "GitHub/Branch"
  })
}

benchmark "cis_supply_chain_v100_3_2" {
  title         = "3.2 Validate Packages"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_2.md")
  children = [
    control.cis_supply_chain_v100_3_2_2,
    control.cis_supply_chain_v100_3_2_3
  ]

  tags = merge(local.cis_supply_chain_v100_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_3_2_2" {
  title         = "3.2.2 Ensure packages are automatically scanned for known vulnerabilities"
  description   = "Automatically scan every package for vulnerabilities."
  query         = query.default_branch_pipelines_scan_for_vulnerabilities
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_2_2.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
    service               = "GitHub/Branch"
  })
}

control "cis_supply_chain_v100_3_2_3" {
  title         = "3.2.3 Ensure packages are automatically scanned for license implications"
  description   = "A software license is a document that provides legal conditions and guidelines for the use and distribution of software, usually defined by the author. It is recommended to scan for any legal implications automatically."
  query         = query.default_branch_pipelines_scan_for_vulnerabilities
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_2_3.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
    service               = "GitHub/Branch"
  })
}
