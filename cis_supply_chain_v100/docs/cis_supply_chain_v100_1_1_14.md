## Description

Ensure administrators are subject to branch protection rules.

## Rationale

Administrators by default are excluded from any branch protection rules. This means these privileged users (on both the repository and organization levels) are not subject to protections meant to prevent untrusted code insertion, including malicious code. This is extremely important since administrator accounts are often targeted for account hijacking due to their privileged role.

**Note**: Administrator users will not be able to push code directly to the protected branch without being compliant with listed branch protection rules.

## Audit

For each repository in use, validate branch protection rules also apply to administrator accounts.

## Remediation

For each repository in use, enforce branch protection rules on administrators, as well.
