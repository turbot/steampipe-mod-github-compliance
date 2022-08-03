locals {
  cis_supply_chain_v100_2_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_supply_chain_v100_2_1_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "2.1"
  })
  cis_supply_chain_v100_2_2_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "2.2"
  })
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
    benchmark.cis_supply_chain_v100_2_1,
    benchmark.cis_supply_chain_v100_2_2,
    benchmark.cis_supply_chain_v100_2_3,
    benchmark.cis_supply_chain_v100_2_4
  ]

  tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_2_1" {
  title         = "1.1 Build Environment"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1.md")
  children = [
    control.cis_supply_chain_v100_2_1_1,
    control.cis_supply_chain_v100_2_1_2,
    control.cis_supply_chain_v100_2_1_3,
    control.cis_supply_chain_v100_2_1_4,
    control.cis_supply_chain_v100_2_1_5,
    control.cis_supply_chain_v100_2_1_6
  ]

  tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_2_1_1" {
  title         = "2.1.1 Ensure each pipeline has a single responsibility"
  description   = "Ensure each pipeline has a single responsibility in the build process."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1_1.md")

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_2_1_2" {
  title         = "2.1.2 Ensure all aspects of the pipeline infrastructure and configuration are immutable"
  description   = "Ensure the pipeline orchestrator and its configuration are immutable."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1_2.md")

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_2_1_3" {
  title         = "2.1.3 Ensure the build environment is logged"
  description   = "Keep build logs of the build environment detailing configuration and all activity within it. Also, consider storing them in a centralized organizational log store."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1_3.md")

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_2_1_4" {
  title         = "2.1.4 Ensure the creation of the build environment is automated"
  description   = "Automate the creation of the build environment."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1_4.md")

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_2_1_5" {
  title         = "2.1.5 Ensure access to build environments is limited"
  description   = "Restrict access to the build environment (orchestrator, pipeline executor, their environment, etc.) to trusted and qualified users only."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1_5.md")

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_1_6" {
  title         = "2.1.6 Ensure users must authenticate to access the build environment"
  description   = "Require users to log in to access the build environment—the orchestrator, the pipeline executer, where the build workers are running, etc"
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1_6.md")

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

benchmark "cis_supply_chain_v100_2_2" {
  title         = "2.2 Build Worker"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_2.md")
  children = [
    control.cis_supply_chain_v100_2_2_1,
    control.cis_supply_chain_v100_2_2_2,
    control.cis_supply_chain_v100_2_2_3,
    control.cis_supply_chain_v100_2_2_4,
    control.cis_supply_chain_v100_2_2_5,
    control.cis_supply_chain_v100_2_2_6,
    control.cis_supply_chain_v100_2_2_7,
    control.cis_supply_chain_v100_2_2_8
  ]

  tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_2_2_1" {
  title         = "2.2.1 Ensure build workers are single-used"
  description   = "Use a clean instance of build worker for every pipeline run."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_2_1.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_2_2" {
  title         = "2.2.2 Ensure build worker environments and commands are passed and not pulled"
  description   = "A worker’s environment can be passed (for example, a pod in a Kubernetes cluster in which an environment variable is passed to it). It also can be pulled, like a virtual machine that is installing a package. Ensure that the environment and commands are passed to the workers and not pulled from it."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_2_2.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_2_3" {
  title         = "2.2.3 Ensure the duties of each build worker are segregated"
  description   = "Separate responsibilities in the build workflow, such as testing, compiling, pushing artifacts, etc., to different build workers so that each worker will have a single duty."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_2_3.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_2_4" {
  title         = "2.2.4 Ensure build workers have minimal network connectivity"
  description   = "Ensure that build workers have minimal network connectivity."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_2_4.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_2_5" {
  title         = "2.2.5 Ensure run-time security is enforced for build workers"
  description   = "Add traces to build workers’ operating systems and installed applications so that in run time, collected events can be analyzed to detect suspicious behavior patterns and malware."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_2_5.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_2_6" {
  title         = "2.2.6 Ensure build workers are automatically scanned for vulnerabilities"
  description   = "Scan build workers for vulnerabilities. It is recommended that this be done automatically."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_2_6.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_2_7" {
  title         = "2.2.7 Ensure build workers’ deployment configuration is stored in a version control platform"
  description   = "Store the deployment configuration of build workers in a version control platform, such as Github."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_2_7.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_2_8" {
  title         = "2.2.8 Ensure resource consumption of build workers is monitored"
  description   = "Monitor the resource consumption of build workers and set alerts for high consumption that can lead to resource exhaustion."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_2_8.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

benchmark "cis_supply_chain_v100_2_3" {
  title         = "2.3 Pipeline Instructions"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3.md")
  children = [
    control.cis_supply_chain_v100_2_3_1,
    control.cis_supply_chain_v100_2_3_2,
    control.cis_supply_chain_v100_2_3_3,
    control.cis_supply_chain_v100_2_3_4,
    control.cis_supply_chain_v100_2_3_5,
    control.cis_supply_chain_v100_2_3_6,
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
  sql           = query.default_branch_all_build_steps_as_code.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_1.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_2_3_2" {
  title         = "2.3.2 Ensure steps have clearly defined build stage input and output"
  description   = "Define clear expected input and output for each build stage."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_2.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_3_3" {
  title         = "2.3.3 Ensure output is written to a separate, secured storage repository"
  description   = "Write pipeline output artifacts to a secured storage repository."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_3.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_3_4" {
  title         = "2.3.4 Ensure changes to pipeline files are tracked and reviewed"
  description   = "Track and review changes to pipeline files."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_4.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_3_5" {
  title         = "2.3.5 Ensure access to build process triggering is minimized"
  description   = "Restrict access to pipeline triggers."
  sql           = query.to_do_delete_me.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_5.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_3_6" {
  title         = "2.3.6 Ensure pipelines are automatically scanned for misconfigurations"
  description   = "Scan the pipeline for misconfigurations. It is recommended that this be performed automatically."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_6.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_3_7" {
  title         = "2.3.7 Ensure pipelines are automatically scanned for vulnerabilities"
  description   = "Scan pipelines for vulnerabilities. It is recommended that this be implemented automatically."
  sql           = query.default_branch_pipelines_scan_for_vulnerabilities.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_7.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_2_3_8" {
  title         = "2.3.8 Ensure scanners are in place to identify and prevent sensitive data in pipeline files"
  description   = "Detect and prevent sensitive data, such as confidential ID numbers, passwords, etc., inpipelines."
  sql           = query.default_branch_pipelines_scanners_set_to_prevent_sensitive_data.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_3_8.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

benchmark "cis_supply_chain_v100_2_4" {
  title         = "2.4 Pipeline Integrity"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4.md")
  children = [
    control.cis_supply_chain_v100_2_4_1,
    control.cis_supply_chain_v100_2_4_2,
    control.cis_supply_chain_v100_2_4_3,
    control.cis_supply_chain_v100_2_4_4,
    control.cis_supply_chain_v100_2_4_5,
    control.cis_supply_chain_v100_2_4_6
  ]

  tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_2_4_1" {
  title         = "2.4.1 Ensure all artifacts on all releases are signed"
  description   = "Sign all artifacts in all releases with user or organization keys."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4_1.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_4_2" {
  title         = "2.4.2 Ensure all external dependencies used in the build process are locked"
  description   = "External dependencies may be public packages needed in the pipeline, or perhaps the public image being used for the build worker. Lock these external dependencies in every build pipeline."
  sql           = query.default_branch_pipeline_locks_external_dependencies_for_build_process.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4_2.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_2_4_3" {
  title         = "2.4.3 Ensure dependencies are validated before being used"
  description   = "Validate every dependency of the pipeline before use."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4_3.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_4_4" {
  title         = "2.4.4 Ensure the build pipeline creates reproducible artifacts"
  description   = "Verify that the build pipeline creates reproducible artifacts, meaning that an artifact of the build pipeline is the same in every run when given the same input."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4_4.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_4_5" {
  title         = "2.4.5 Ensure pipeline steps produce a Software Bill of Materials (SBOM)"
  description   = "An SBOM is a file that specifies each component of software or a build process. Generate an SBOM after each run of a pipeline."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4_5.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_2_4_6" {
  title         = "2.4.6 Ensure pipeline steps sign the SBOM produced"
  description   = "An SBOM is a file that specifies each component of software or a build process. It should be generated after every pipeline run. After it is generated, it must then be signed."
  sql           = query.to_do_delete_me.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_4_6.md")

  tags = merge(local.cis_supply_chain_v100_2_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}
