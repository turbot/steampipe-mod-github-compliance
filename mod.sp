// Benchmarks and controls for specific services should override the "service" tag
locals {
  github_compliance_common_tags = {
    category = "Compliance"
    plugin   = "github"
    service  = "GitHub"
    # include_forks = "false"
  }
}

mod "github_compliance" {
  # hub metadata
  title       = "CIS Software Supply Chain v1.0.0"
  description = " #TODO"
  color       = "#FF9900"
  # documentation = file("./docs/index.md")
  # icon          = "/images/mods/turbot/aws-compliance.svg"
  # categories    = ["aws", "cis", "compliance", "pci dss", "public cloud", "security"]

  # opengraph {
  #   title       = "Steampipe Mod for GitHub Compliance"
  #   description = " #TODO"
  #   # image       = "/images/mods/turbot/aws-compliance-social-graphic.png"
  # }

  require {
    plugin "github" {
      version = "0.18.0"
    }
  }
}
