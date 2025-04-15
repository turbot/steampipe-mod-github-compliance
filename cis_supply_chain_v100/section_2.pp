locals {
  cis_supply_chain_v100_2_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_supply_chain_v100_2_3_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "2.3"
  })
  cis_supply_chain_v100_2_4_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "2.4"
  })
}

benchmark "cis_supply_chain_v100_2" {
  title         = "2 Build Pipelines"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2.md")
  children = [
    benchmark.cis_supply_chain_v100_2_3,
    benchmark.cis_supply_chain_v100_2_4
  ]

  tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_2_3" {
  title         = "2.3 Pipeline Instructions"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3.md")
  children = [
    control.cis_supply_chain_v100_2_3_1,
    control.cis_supply_chain_v100_2_3_5,
    control.cis_supply_chain_v100_2_3_7,
    control.cis_supply_chain_v100_2_3_8
  ]

  tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_2_3_1" {
  title         = "2.3.1 Ensure all build steps are defined as code"
  description   = "Use pipeline as code for build pipelines and their defined steps."
  query         = query.default_branch_all_build_steps_as_code
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_1.md")

  tags = merge(local.cis_supply_chain_v100_2_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
    service               = "GitHub/Branch"
  })
}

control "cis_supply_chain_v100_2_3_5" {
  title         = "2.3.5 Ensure access to build process triggering is minimized"
  description   = "Restrict access to pipeline triggers."
  query         = query.org_default_repo_permission_none_read
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_5.md")

  tags = merge(local.cis_supply_chain_v100_2_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
    service               = "GitHub/Organization"
  })
}

control "cis_supply_chain_v100_2_3_7" {
  title         = "2.3.7 Ensure pipelines are automatically scanned for vulnerabilities"
  description   = "Scan pipelines for vulnerabilities. It is recommended that this be implemented automatically."
  query         = query.default_branch_pipelines_scan_for_vulnerabilities
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_7.md")

  tags = merge(local.cis_supply_chain_v100_2_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
    service               = "GitHub/Branch"
  })
}

control "cis_supply_chain_v100_2_3_8" {
  title         = "2.3.8 Ensure scanners are in place to identify and prevent sensitive data in pipeline files"
  description   = "Detect and prevent sensitive data, such as confidential ID numbers, passwords, etc., inpipelines."
  query         = query.default_branch_pipelines_scanners_set_to_prevent_sensitive_data
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_8.md")

  tags = merge(local.cis_supply_chain_v100_2_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
    service               = "GitHub/Branch"
  })
}

benchmark "cis_supply_chain_v100_2_4" {
  title         = "2.4 Pipeline Integrity"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4.md")
  children = [
    control.cis_supply_chain_v100_2_4_2,
    control.cis_supply_chain_v100_2_4_6
  ]

  tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_2_4_2" {
  title         = "2.4.2 Ensure all external dependencies used in the build process are locked"
  description   = "External dependencies may be public packages needed in the pipeline, or perhaps the public image being used for the build worker. Lock these external dependencies in every build pipeline."
  query         = query.default_branch_pipeline_locks_external_dependencies_for_build_process
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4_2.md")

  tags = merge(local.cis_supply_chain_v100_2_4_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
    service               = "GitHub/Branch"
  })
}

control "cis_supply_chain_v100_2_4_6" {
  title         = "2.4.6 Ensure pipeline steps sign the SBOM produced"
  description   = "An SBOM is a file that specifies each component of software or a build process. It should be generated after every pipeline run. After it is generated, it must then be signed."
  query         = query.default_branch_pipeline_must_have_jobs_with_sbom_generation
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4_6.md")

  tags = merge(local.cis_supply_chain_v100_2_4_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
    service               = "GitHub/Branch"
  })
}
