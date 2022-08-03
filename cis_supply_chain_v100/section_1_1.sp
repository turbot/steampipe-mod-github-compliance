benchmark "cis_supply_chain_v100_1_1" {
  title         = "1.1 Code Changes"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1.md")
  children = [
    control.cis_supply_chain_v100_1_1_1,
    control.cis_supply_chain_v100_1_1_2,
    control.cis_supply_chain_v100_1_1_3,
    control.cis_supply_chain_v100_1_1_4,
    control.cis_supply_chain_v100_1_1_5,
    control.cis_supply_chain_v100_1_1_6,
    control.cis_supply_chain_v100_1_1_7,
    control.cis_supply_chain_v100_1_1_8,
    control.cis_supply_chain_v100_1_1_9,
    control.cis_supply_chain_v100_1_1_10,
    control.cis_supply_chain_v100_1_1_11,
    control.cis_supply_chain_v100_1_1_12,
    control.cis_supply_chain_v100_1_1_13,
    control.cis_supply_chain_v100_1_1_14,
    control.cis_supply_chain_v100_1_1_15,
    control.cis_supply_chain_v100_1_1_16,
    control.cis_supply_chain_v100_1_1_17,
    control.cis_supply_chain_v100_1_1_18,
    control.cis_supply_chain_v100_1_1_19
  ]

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_supply_chain_v100_1_1_1" {
  title         = "1.1.1 Ensure any changes to code are tracked in a version control platform"
  description   = "Manage all code projects in a version control platform."
  sql           = query.default_branch_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_1.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_1_2" {
  title         = "1.1.2 Ensure any change to code can be traced back to its associated task"
  description   = "Use a task management system to trace any code back to its associated task."
  sql           = query.default_branch_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_2.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
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

control "cis_supply_chain_v100_1_1_7" {
  title         = "1.1.7 Ensure code owner's review is required when a change affects owned code"
  description   = "Ensure trusted code owners are required to review and approve any code change proposal made to their respective owned areas in the code base."
  sql           = query.default_branch_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_7.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_1_8" {
  title         = "1.1.8 Ensure inactive branches are periodically reviewed and removed"
  description   = "Keep track of code branches that are inactive for a lengthy period of time and periodically remove them."
  sql           = query.repo_delete_branch_on_merge_enabled.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_8.md")

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

control "cis_supply_chain_v100_1_1_18" {
  title         = "1.1.18 Ensure any merging of code is automatically scanned for risks"
  description   = "Ensure that every pull request is required to be scanned for risks."
  sql           = query.default_branch_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_18.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}

control "cis_supply_chain_v100_1_1_19" {
  title         = "1.1.19 Ensure any changes to branch protection rules are audited"
  description   = "Ensure that changes in the branch protection rules are audited."
  sql           = query.default_branch_manual_control.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_1_1_19.md")

  tags = merge(local.cis_supply_chain_v100_1_1_common_tags, {
    cis                   = "true"
    cis_supply_chain_v100 = "true"
    cis_type              = "manual"
  })

}
