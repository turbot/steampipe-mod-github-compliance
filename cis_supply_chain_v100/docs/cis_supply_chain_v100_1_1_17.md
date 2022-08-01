## Description

Ensure that users with only push access are incapable of deleting a protected branch.

## Rationale

When enabling deletion of a protected branch, any user with at least push access to the repository can delete a branch. This can be potentially dangerous, as a simple human mistake or a hacked account can lead to data loss if a branch is deleted. It is therefore crucial to prevent such incidents by denying protected branch deletion.

*Note* Protected branches cannot be deleted.

## Audit

For each repository that is being used, verify that protected branches cannot be deleted.

## Remediation

For each repository that is being used, block the option to delete protected branches via branch protection rules.
