## Description

Linear history is the name for Git history where all commits are listed in chronological order, one after another. Such history exists if a pull request is merged either by rebase merge (reorders the commits history) or squash merge (squashes all commits to one). Ensure that linear history is required by requiring the use of rebase or squash merge when merging a pull request.

## Rationale

Enforcing linear history produces a clear record of activity, and as such it offers specific advantages: it is easier to follow, it is easier to revert a change, and bugs can be found more easily.

**Note** Pull requests cannot be merged except by squash or rebase merge.

## Audit

For each repository in use, ensure that linear history is required and/or that only squash merge and rebase merge are allowed.

## Remediation

For each repository in use, require linear history and/or allow only rebase merge and squash merge.
