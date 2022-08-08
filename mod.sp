// Benchmarks and controls for specific services should override the "service" tag
locals {
  github_compliance_common_tags = {
    category = "Compliance"
    plugin   = "github"
    service  = "GitHub"
  }
}

mod "github_compliance" {
  # hub metadata
  title         = "GitHub Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for GitHub across your repositories and organizations using Steampipe."
  color         = "#191717"
  documentation = file("./docs/index.md")
  # icon          = "/images/mods/turbot/github-compliance.svg"
  categories = ["github", "cis", "compliance", "security"]

  opengraph {
    title       = "Steampipe Mod for GitHub Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for GitHub across your repositories and organizations using Steampipe."
    # image       = "/images/mods/turbot/github-compliance-social-graphic.png"
  }

  require {
    plugin "github" {
      version = "0.18.0"
    }
  }
}
