## Description

The "force push" option allows users with "push" permissions to force their changes directly to the branch without a pull request, and thus should be disabled.

## Rationale

The "force push" option allows users to override the existing code with their own code. This can lead to both intentional and unintentional data loss, as well as data infection with malicious code. Disabling the “force push” option prohibits users from forcing their changes to the main branch, which ultimately prevents malicious code from entering source code.

**Note** Users cannot "force push" to protected branches.

## Audit

For each repository in use, validate that no one can "force push" code.

## Remediation

For each repository in use, block the option to "force push" code.
