mod "github_compliance" {
  # hub metadata
  title         = "GitHub Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for GitHub across your repositories and organizations using Powerpipe and Steampipe."
  color         = "#191717"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/github-compliance.svg"
  categories    = ["github", "cis", "compliance", "security"]

  opengraph {
    title       = "Powerpipe Mod for GitHub Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for GitHub across your repositories and organizations using Powerpipe and Steampipe."
    image       = "/images/mods/turbot/github-compliance-social-graphic.png"
  }

  require {
    plugin "github" {
      min_version = "0.28.0"
    }
  }
}
