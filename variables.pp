// Benchmarks and controls for specific services should override the "service" tag
locals {
  github_compliance_common_tags = {
    category = "Compliance"
    plugin   = "github"
    service  = "GitHub"
  }
}

variable "trusted_repo_admins" {
  type        = list(string)
  default     = [""]
  description = "A list of github users allowed to delete the repository."
}

variable "trusted_issue_admins" {
  type        = list(string)
  default     = [""]
  description = "A list of github users allowed to delete the issue."
}
