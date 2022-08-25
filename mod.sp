// Benchmarks and controls for specific services should override the "service" tag
locals {
  github_compliance_common_tags = {
    category = "Compliance"
    plugin   = "github"
    service  = "GitHub"
  }
}

variable "repo_pattern" {
  type        = string
  default     = "ops"
  description = "A regex to match github_my_repository.full_name. To pass multiple values, seperate them with a pipe. Example: 'steampipe-(mod|plugin)'"
}

mod "github_compliance" {
  # hub metadata
  title         = "GitHub Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for GitHub across your repositories and organizations using Steampipe."
  color         = "#191717"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/github-compliance.svg"
  categories    = ["github", "cis", "compliance", "security"]

  opengraph {
    title       = "Steampipe Mod for GitHub Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for GitHub across your repositories and organizations using Steampipe."
    image       = "/images/mods/turbot/github-compliance-social-graphic.png"
  }

  require {
    plugin "github" {
      version = "0.19.0"
    }
  }
}
