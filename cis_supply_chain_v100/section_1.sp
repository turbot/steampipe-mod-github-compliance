variable "trusted_repo_admin" {
  type        = list(string)
  default     = [""]
  description = "A list of github users allowed to delete the repository."
}

variable "trusted_issue_admin" {
  type        = list(string)
  default     = [""]
  description = "A list of github users allowed to delete the issue."
}

locals {
  cis_supply_chain_v100_1_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "1"
  })
}

locals {
  cis_supply_chain_v100_1_1_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.1"
  })
  cis_supply_chain_v100_1_2_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.2"
  })
  cis_supply_chain_v100_1_3_common_tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    cis_section_id = "1.3"
  })
}

benchmark "cis_supply_chain_v100_1" {
  title         = "1 Source Code"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1.md")
  children = [
    benchmark.cis_supply_chain_v100_1_1,
    benchmark.cis_supply_chain_v100_1_2,
    benchmark.cis_supply_chain_v100_1_3,
  ]

  tags = merge(local.cis_supply_chain_v100_1_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_1_1" {
  title         = "1.1 Code Changes"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1.md")
  children = [
    control.cis_supply_chain_v100_1_1_3,
    control.cis_supply_chain_v100_1_1_4,
    control.cis_supply_chain_v100_1_1_5,
    control.cis_supply_chain_v100_1_1_6,
    control.cis_supply_chain_v100_1_1_9,
    control.cis_supply_chain_v100_1_1_10,
    control.cis_supply_chain_v100_1_1_11,
    control.cis_supply_chain_v100_1_1_12,
    control.cis_supply_chain_v100_1_1_13,
    control.cis_supply_chain_v100_1_1_14,
    control.cis_supply_chain_v100_1_1_15,
    control.cis_supply_chain_v100_1_1_16,
    control.cis_supply_chain_v100_1_1_17
  ]

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_1_1_3" {
  title         = "1.1.3 Ensure any change to code receives approval of two strongly authenticated users"
  description   = "Ensure that every code change is reviewed and approved by two authorized contributors who are both strongly authenticated, from the team relevant to the code change."
  sql           = query.default_branch_requires_2_pull_request_reviews.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_3.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_4" {
  title         = "1.1.4 Ensure previous approvals are dismissed when updates are introduced to a code change proposal"
  description   = "Ensure that when a proposed code change is updated, previous approvals are declined and new approvals are required."
  sql           = query.default_branch_must_dismiss_stale_approvals.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_4.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_5" {
  title         = "1.1.5 Ensure there are restrictions on who can dismiss code change reviews"
  description   = "Only trusted users should be allowed to dismiss code change reviews."
  sql           = query.default_branch_code_change_review_dismissal_restrictions.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_5.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_6" {
  title         = "1.1.6 Ensure code owners are set for extra sensitive code or configuration"
  description   = "Code owners are trusted users that are responsible for reviewing and managing an important piece of code or configuration. An organization is advised to set code owners for every extremely sensitive code or configuration."
  sql           = query.default_branch_requires_code_owners_review.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_6.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_9" {
  title         = "1.1.9 Ensure all checks have passed before merging new code"
  description   = "Before a code change request can be merged to the code base, all predefined checks must ssuccessfully pass."
  sql           = query.default_branch_requires_status_checks.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_9.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_10" {
  title         = "1.1.10 Ensure open Git branches are up to date before they can be merged into code base"
  description   = "Organizations should make sure each suggested code change is in full sync with the existing state of its origin code repository before allowing merging."
  sql           = query.repo_open_branches_are_upto_date_before_merge.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_10.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_11" {
  title         = "1.1.11 Ensure all open comments are resolved before allowing code change merging"
  description   = "Organizations should enforce a 'no open comments' policy before allowing code change merging."
  sql           = query.repo_no_open_comments.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_11.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_12" {
  title         = "1.1.12 Ensure verification of signed commits for new changes before merging"
  description   = "Ensure every commit in a pull request is signed and verified before merging."
  sql           = query.default_branch_requires_signed_commits.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_12.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_13" {
  title         = "1.1.13 Ensure linear history is required"
  description   = "Linear history is the name for Git history where all commits are listed in chronological order, one after another. Such history exists if a pull request is merged either by rebase merge (reorders the commits history) or squash merge (squashes all commits to one). Ensure that linear history is required by requiring the use of rebase or squash merge when merging a pull request."
  sql           = query.repo_linear_history_enabled.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_13.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_14" {
  title         = "1.1.14 Ensure branch protection rules are enforced for administrators"
  description   = "Ensure administrators are subject to branch protection rules."
  sql           = query.default_branch_protections_apply_to_admins.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_14.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_15" {
  title         = "1.1.15 Ensure pushing or merging of new code is restricted to specific individuals or teams"
  description   = "Ensure that only trusted users can push or merge new code to protected branches."
  sql           = query.default_branch_restrict_push_and_merge.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_15.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_16" {
  title         = "1.1.16 Ensure force push code to branches is denied"
  description   = "The 'force push' option allows users with 'push' permissions to force their changes directly to the branch without a pull request, and thus should be disabled."
  sql           = query.default_branch_blocks_force_push.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_16.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_1_17" {
  title         = "1.1.17 Ensure branch deletions are denied"
  description   = "Ensure that users with only push access are incapable of deleting a protected branch."
  sql           = query.branch_default_setting_block_deletion.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_17.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

benchmark "cis_supply_chain_v100_1_2" {
  title         = "1.2 Repository Management"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_2.md")
  children = [
    control.cis_supply_chain_v100_1_2_1,
    control.cis_supply_chain_v100_1_2_2,
    control.cis_supply_chain_v100_1_2_3,
    control.cis_supply_chain_v100_1_2_4,
    control.cis_supply_chain_v100_1_2_7,
  ]

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_1_2_1" {
  title         = "1.2.1 Ensure all public repositories contain a SECURITY.md file"
  description   = "A SECURITY.md file is a security policy file that offers instruction on reporting security vulnerabilities in a project. When someone creates an issue within a specific project, a link to the SECURITY.md file will subsequently be shown."
  sql           = query.public_repo_has_security_md_file.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_2_1.md")

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_2_2" {
  title         = "1.2.2 Ensure repository creation is limited to specific members"
  description   = "Limit the ability to create repositories to trusted users and teams."
  sql           = query.org_members_cannot_create_repos.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_2_2.md")

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}


control "cis_supply_chain_v100_1_2_3" {
  title         = "1.2.3 Ensure repository deletion is limited to specific users"
  description   = "Ensure only a limited number of trusted users can delete repositories."
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_2_3.md")
  sql           = query.repo_deletion_limited_to_trusted_users.sql

  param "trusted_repo_admin" {
    description = "A list of github users allowed to delete the repository."
    default     = var.trusted_repo_admin
  }

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_2_4" {
  title         = "1.2.4 Ensure issue deletion is limited to specific users"
  description   = "Ensure only trusted and responsible users can delete issues."
  sql           = query.repo_issue_deletion_limited_to_trusted_users.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_2_4.md")

  param "trusted_issue_admin" {
    description = "A list of github users allowed to delete the issue."
    default     = var.trusted_issue_admin
  }

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_2_7" {
  title         = "1.2.4 Ensure inactive repositories are reviewed and archived periodically"
  description   = "Ensure inactive repositories are reviewed and archived periodically."
  sql           = query.repo_inactive_more_than_90_days.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_2_7.md")

  tags = merge(local.cis_supply_chain_v100_1_2_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

benchmark "cis_supply_chain_v100_1_3" {
  title         = "1.3 Contribution Access"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_3.md")
  children = [
    control.cis_supply_chain_v100_1_3_1,
    control.cis_supply_chain_v100_1_3_3,
    control.cis_supply_chain_v100_1_3_5,
    control.cis_supply_chain_v100_1_3_7,
    control.cis_supply_chain_v100_1_3_8,
    control.cis_supply_chain_v100_1_3_9
  ]

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_1_3_1" {
  title         = "1.3.1 Ensure inactive users are reviewed and removed periodically"
  description   = "Track inactive user accounts and periodically remove them."
  sql           = query.repository_inactive_members_review.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_3_1.md")

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })
}

control "cis_supply_chain_v100_1_3_3" {
  title         = "1.3.3 Ensure minimum number of administrators are set for the organization"
  description   = "Ensure the organization has a minimum number of administrators."
  sql           = query.organization_minimum_administrators_set.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_3_3.md")

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_3_5" {
  title         = "1.3.5 Ensure the organization is requiring members to use Multi-Factor Authentication (MFA)"
  description   = "Require members of the organization to use Multi-Factor Authentication (MFA) in addition to a standard user name and password when authenticating to the source code management platform."
  sql           = query.org_two_factor_required.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_3_5.md")

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_3_7" {
  title         = "1.3.7 Ensure two administrators are set for each repository"
  description   = "Ensure every repository has two users with administrative permissions."
  sql           = query.repo_should_have_two_admins.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_3_7.md")

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_3_8" {
  title         = "1.3.8 Ensure strict base permissions are set for repositories"
  description   = "Base permissions define the permission level automatically granted to all organization members. Define strict base access permissions for all of the repositories in the organization, including new ones."
  sql           = query.org_strict_default_permission.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_3_8.md")

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}

control "cis_supply_chain_v100_1_3_9" {
  title         = "1.3.9 Ensure an organization's identity is confirmed with a 'Verified' badge"
  description   = "Confirm the domains an organization owns with a 'Verified' badge."
  sql           = query.org_domain_verified.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_3_9.md")

  tags = merge(local.cis_supply_chain_v100_1_3_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "automated"
  })
}
