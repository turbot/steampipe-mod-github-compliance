## Description

Ensure every commit in a pull request is signed and verified before merging.

## Rationale

Signing commits, or requiring to sign commits, gives other users confidence about the origin of a specific code change. It ensures that the author of the change is not hidden and is verified by the version control system, thus the change comes from a trusted source.

**Note**: Pull requests with unsigned commits cannot be merged.

## Audit

Ensure only signed commits can be merged for every branch, especially the main branch, via branch protection rules.

## Remediation

For each repository in use, enforce the branch protection rule of requiring signed commits, and make sure only signed commits are capable of merging.
