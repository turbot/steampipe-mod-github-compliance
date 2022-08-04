locals {
  cis_supply_chain_v100_4_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "4"
  })
}

locals {
  cis_supply_chain_v100_4_1_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "4.1"
  })
  cis_supply_chain_v100_4_2_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "4.2"
  })
  cis_supply_chain_v100_4_3_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "4.3"
  })
  cis_supply_chain_v100_4_4_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "4.4"
  })
}

benchmark "cis_supply_chain_v100_4" {
  title         = "4 Artifacts"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4.md")
  children = [
    benchmark.cis_supply_chain_v100_4_1,
    benchmark.cis_supply_chain_v100_4_2,
    benchmark.cis_supply_chain_v100_4_3,
    benchmark.cis_supply_chain_v100_4_4
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_4_1" {
  title         = "4.1 Verification"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_1.md")
  children = [
    control.cis_supply_chain_v100_4_1_1,
    control.cis_supply_chain_v100_4_1_2,
    control.cis_supply_chain_v100_4_1_3
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_4_1_1" {
  title         = "4.1.1 Ensure all artifacts are signed by the build pipeline itself"
  description   = "Configure the build pipeline to sign every artifact it produces and verify that each artifact has the appropriate signature."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_1_1.md")

  tags = merge(local.cis_supply_chain_v100_4_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_4_1_2" {
  title         = "4.1.2 Ensure artifacts are encrypted before distribution"
  description   = "Encrypt artifacts before they are distributed and ensure only trusted platforms have decryption capabilities"
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_1_2.md")

  tags = merge(local.cis_supply_chain_v100_4_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_4_1_3" {
  title         = "4.1.3 Ensure only authorized platforms have decryption capabilities of artifacts"
  description   = "Grant decryption capabilities of artifacts only to trusted and authorized platforms."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_1_3.md")

  tags = merge(local.cis_supply_chain_v100_4_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

benchmark "cis_supply_chain_v100_4_2" {
  title         = "4.2 Access to Artifacts"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2.md")
  children = [
    control.cis_supply_chain_v100_4_2_1,
    control.cis_supply_chain_v100_4_2_2,
    control.cis_supply_chain_v100_4_2_3,
    control.cis_supply_chain_v100_4_2_4,
    control.cis_supply_chain_v100_4_2_5
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_4_2_1" {
  title         = "4.2.1 Ensure factor authorization to certify certain artifacts is limited"
  description   = "Software certification is used to verify the safety of certain software usage and to establish trust between the supplier and the consumer. Any artifact can be certified. Limit which artifacts any given factor is authorized to certify."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2_1.md")

  tags = merge(local.cis_supply_chain_v100_4_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_4_2_2" {
  title         = "4.2.2 Ensure number of permitted users who may upload new artifacts is minimized"
  description   = "Minimize the ability to upload artifacts to the lowest number of trusted users possible."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2_2.md")

  tags = merge(local.cis_supply_chain_v100_4_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
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

control "cis_supply_chain_v100_4_2_4" {
  title         = "4.2.4 Ensure user management of the package registry is not local"
  description   = "Manage users and their access to the package registry with an external authentication server and not with the package registry itself."
  sql           = query.org_two_factor_required.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2_4.md")

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

benchmark "cis_supply_chain_v100_4_3" {
  title         = "4.3 Package Registries"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_3.md")
  children = [
    control.cis_supply_chain_v100_4_3_1,
    control.cis_supply_chain_v100_4_3_2,
    control.cis_supply_chain_v100_4_3_3,
    control.cis_supply_chain_v100_4_3_4
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_4_3_1" {
  title         = "4.3.1 Ensure all signed artifacts are validated upon uploading the package registry"
  description   = "Validate artifact signatures before uploading to the package registry."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_3_1.md")

  tags = merge(local.cis_supply_chain_v100_4_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_4_3_2" {
  title         = "4.3.2 Ensure all versions of an existing artifact have their signatures validated"
  description   = "Validate the signatures of all versions of an existing artifact."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_3_2.md")

  tags = merge(local.cis_supply_chain_v100_4_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_4_3_3" {
  title         = "4.3.3 Ensure changes in package registry configuration are audited"
  description   = "Audit changes of the package registry configuration."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_3_3.md")

  tags = merge(local.cis_supply_chain_v100_4_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_4_3_4" {
  title         = "4.3.4 Ensure webhooks of the package registry are secured"
  description   = "Use secured webhooks of the package registry."
  sql           = query.repo_webhook_package_registery_security_settings_enabled.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_3_4.md")

  tags = merge(local.cis_supply_chain_v100_4_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}


benchmark "cis_supply_chain_v100_4_4" {
  title         = "4.4 Origin Traceability"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_4.md")
  children = [
    control.cis_supply_chain_v100_4_4_1,
    control.cis_supply_chain_v100_4_4_2
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_4_4_1" {
  title         = "4.4.1 Ensure artifacts contain information about their origin"
  description   = "When delivering artifacts, ensure they have information about their origin. This may be done by providing an SBOM or some metadata files."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_4_1.md")

  tags = merge(local.cis_supply_chain_v100_4_4_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_4_4_2" {
  title         = "4.4.2 Ensure private artifacts are not allowed to be pulled from external registries"
  description   = "Proxy registries can proxy requests of internal packages to a public registry if grouped with an internal hosted registry. Block the option to request private packages from the proxy registry so that they will be pulled only from the hosted registry."
  sql           = query.repo_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_4_2.md")

  tags = merge(local.cis_supply_chain_v100_4_4_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}
