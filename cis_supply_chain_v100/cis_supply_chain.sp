locals {
  cis_supply_chain_v100_common_tags = merge(local.github_compliance_common_tags, {
    cis         = "true"
    cis_version = "v1.0.0"
  })
}

benchmark "cis_supply_chain_v100" {
  title         = "CIS Software Supply Chain v1.0.0"
  description   = "This section consists of security recommendations for proper source code management of any application developed by the organization. This is the first phase of the software supply chain, and is considered the single source of truth for the rest of the process. It is critical to secure both the source code itself, as well as the platform with which it is managed, in order to protect the integrity of a software release. From the developers who commit changes, to the sensitive data or vulnerabilities that could be placed within it, and ultimately to the source code management platform in which it is stored, verification of the integrity of the source code is imperative in order to keep every software update secure."
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_overview.md")
  children = [
    benchmark.cis_supply_chain_v100_1,
    benchmark.cis_supply_chain_v100_2,
    benchmark.cis_supply_chain_v100_3,
    benchmark.cis_supply_chain_v100_4
  ]

  tags = merge(local.cis_supply_chain_v100_common_tags, {
    type = "Benchmark"
  })
}
