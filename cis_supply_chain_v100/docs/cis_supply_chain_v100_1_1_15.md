## Description

Ensure that only trusted users can push or merge new code to protected branches.

## Rationale

Requiring that only trusted users may push or merge new changes reduces the risk of unverified code, especially malicious code, to a protected branch by reducing the number of trusted users who are capable of doing such.

*Note* Only administrators and trusted users can push or merge to the protected branch.

## Audit

For each repository that is being used, ensure only trusted and responsible users can push or merge new code.

## Remediation

For each repository in use, allow only trusted and responsible users to push or merge new code.
