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
    control.cis_supply_chain_v100_3_1_1,
    control.cis_supply_chain_v100_3_1_2,
    control.cis_supply_chain_v100_3_1_3,
    control.cis_supply_chain_v100_3_1_4,
    control.cis_supply_chain_v100_3_1_5,
    control.cis_supply_chain_v100_3_1_6,
    control.cis_supply_chain_v100_3_1_7,
    control.cis_supply_chain_v100_3_1_8,
  ]

  tags = merge(local.cis_supply_chain_v100_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_3_1_1" {
  title         = "3.1.1 Ensure third-party artifacts and open-source libraries are verified"
  description   = "Ensure third-party artifacts and open-source libraries in use are trusted and verified."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1_1.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_1_2" {
  title         = "3.1.2 Ensure SBOM is required from all third-party suppliers"
  description   = "An SBOM is a file that specifies each component of software or a build process. Require an SBOM from every third-party provider."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1_2.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_1_3" {
  title         = "3.1.3 Ensure signed metadata of the build process is required and verified"
  description   = "Require and verify signed metadata of the build process for all dependencies in use."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1_3.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_1_4" {
  title         = "3.1.4 Ensure dependencies are monitored between open-source components"
  description   = "Monitor, or ask software suppliers to monitor, dependencies between open-source components in use."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1_4.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_1_5" {
  title         = "3.1.5 Ensure trusted package managers and repositories are defined and prioritized"
  description   = "Prioritize trusted package registries over others when pulling a package."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1_5.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_1_6" {
  title         = "3.1.6 Ensure a signed SBOM of the code is supplied"
  description   = "An SBOM is a file that specifies each component of software or a build process. When using a dependency, demand its SBOM and ensure it is signed for validation purposes."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1_6.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_1_7" {
  title         = "3.1.7 Ensure dependencies are pinned to a specific, verified version"
  description   = "Pin dependencies to a specific version. Avoid using the “latest” tag or broad version."
  sql           = query.default_branch_pipeline_locks_external_dependencies_for_build_process.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1_7.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_1_8" {
  title         = "3.1.8 Ensure all packages used are more than 60 days old"
  description   = "Use packages that are more than 60 days old."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_1_8.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

benchmark "cis_supply_chain_v100_3_2" {
  title         = "3.2 Validate Packages"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_2.md")
  children = [
    control.cis_supply_chain_v100_3_2_1,
    control.cis_supply_chain_v100_3_2_2,
    control.cis_supply_chain_v100_3_2_3,
    control.cis_supply_chain_v100_3_2_4
  ]

  tags = merge(local.cis_supply_chain_v100_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_3_2_1" {
  title         = "3.2.1 Ensure an organization-wide dependency usage policy is enforced"
  description   = "Enforce a policy for dependency usage across the organization. For example, disallow the use of packages less than 60 days old."
  sql           = query.org_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_2_1.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_2_2" {
  title         = "3.2.2 Ensure packages are automatically scanned for known vulnerabilities"
  description   = "Automatically scan every package for vulnerabilities."
  sql           = query.default_branch_pipelines_scan_for_vulnerabilities.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_2_2.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_2_3" {
  title         = "3.2.3 Ensure packages are automatically scanned for license implications"
  description   = "A software license is a document that provides legal conditions and guidelines for the use and distribution of software, usually defined by the author. It is recommended to scan for any legal implications automatically."
  sql           = query.default_branch_pipelines_scan_for_vulnerabilities.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_2_3.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_3_2_4" {
  title         = "3.2.4 Ensure packages are automatically scanned for ownership change"
  description   = "Scan every package automatically for ownership change."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_3_2_4.md")

  tags = merge(local.cis_supply_chain_v100_3_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}
