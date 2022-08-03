locals {
  cis_supply_chain_v100_5_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "5"
  })
}

locals {
  cis_supply_chain_v100_5_1_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "5.1"
  })
  cis_supply_chain_v100_5_2_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "5.2"
  })
}

benchmark "cis_supply_chain_v100_5" {
  title         = "5 Deployment"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5.md")
  children = [
    benchmark.cis_supply_chain_v100_5_1,
    benchmark.cis_supply_chain_v100_5_2
  ]

  tags = merge(local.cis_supply_chain_v100_5_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_5_1" {
  title         = "5.1 Verification"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_1.md")
  children = [
    control.cis_supply_chain_v100_5_1_1,
    control.cis_supply_chain_v100_5_1_2,
    control.cis_supply_chain_v100_5_1_3,
    control.cis_supply_chain_v100_5_1_4,
    control.cis_supply_chain_v100_5_1_5,
    control.cis_supply_chain_v100_5_1_6,
    control.cis_supply_chain_v100_5_1_7
  ]

  tags = merge(local.cis_supply_chain_v100_5_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_5_1_1" {
  title         = "5.1.1 Ensure deployment configuration files are separated from source code"
  description   = "Deployment configurations are often stored in a version control system. Separate deployment configuration files from source code repositories."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_1_1.md")

  tags = merge(local.cis_supply_chain_v100_5_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_5_1_2" {
  title         = "5.1.2 Ensure changes in deployment configuration are tracked"
  description   = "Audit and track changes made in deployment configuration."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_1_2.md")

  tags = merge(local.cis_supply_chain_v100_5_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_5_1_3" {
  title         = "5.1.3 Ensure scanners are in place to identify and prevent sensitive data in deployment configuration"
  description   = "Detect and prevent sensitive data—such as confidential ID numbers, passwords, etc, in deployment configurations."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_1_3.md")

  tags = merge(local.cis_supply_chain_v100_5_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_5_1_4" {
  title         = "5.1.4 Ensure access to deployment configurations are limited to specific members"
  description   = "Restrict access to the deployment configuration to trusted and qualified users only."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_1_4.md")

  tags = merge(local.cis_supply_chain_v100_5_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_5_1_5" {
  title         = "5.1.5 Ensure scanners are in place to secure Infrastructure as Code (IaC) instructions"
  description   = "Detect and prevent misconfigurations or insecure instructions in Infrastructure as Code (IaC) files, such as Terraform files."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_1_5.md")

  tags = merge(local.cis_supply_chain_v100_5_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_5_1_6" {
  title         = "5.1.6 Ensure deployment configuration manifests are verified"
  description   = "Verify the deployment configuration manifests."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_1_6.md")

  tags = merge(local.cis_supply_chain_v100_5_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_5_1_7" {
  title         = "5.1.7 Ensure deployment configuration manifests are pinned to a specific, verified version"
  description   = "Deployment configuration is often stored in a version control system and is pulled from there. Pin the configuration used to a specific, verified version or commit Secure Hash Algorithm (SHA). Avoid referring configuration without its version tag specified."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_1_7.md")

  tags = merge(local.cis_supply_chain_v100_5_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

benchmark "cis_supply_chain_v100_5_2" {
  title         = "5.2 Deployment Environment"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_2.md")
  children = [
    control.cis_supply_chain_v100_5_2_1,
    control.cis_supply_chain_v100_5_2_2,
    control.cis_supply_chain_v100_5_2_3,
    control.cis_supply_chain_v100_5_2_4,
  ]

  tags = merge(local.cis_supply_chain_v100_5_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_5_2_1" {
  title         = "5.2.1 Ensure deployments are automated"
  description   = "Automate deployments of production environment and application."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_2_1.md")

  tags = merge(local.cis_supply_chain_v100_5_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_5_2_2" {
  title         = "5.2.2 Ensure the deployment environment is reproducible"
  description   = "Verify that the deployment environment—the orchestrator and the production environment where the application is deployed—is reproducible. This means that the environment stays the same in each deployment if the configuration has not changed."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_2_2.md")

  tags = merge(local.cis_supply_chain_v100_5_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_5_2_3" {
  title         = "5.2.3 Ensure access to production environment is limited"
  description   = "Restrict access to the production environment to a few trusted and qualified users only."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_2_3.md")

  tags = merge(local.cis_supply_chain_v100_5_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_5_2_4" {
  title         = "5.2.4 Ensure default passwords are not used"
  description   = "Do not use default passwords of deployment tools and components."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_5_2_4.md")

  tags = merge(local.cis_supply_chain_v100_5_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}