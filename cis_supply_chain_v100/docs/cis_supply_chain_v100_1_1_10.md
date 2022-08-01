## Description

Organizations should make sure each suggested code change is in full sync with the existing state of its origin code repository before allowing merging.

## Rationale

Git branches can easily become outdated since the origin code repository is constantly being edited. This means engineers working on separate code branches can accidentally include outdated code with potential security issues that might have already been fixed, overriding the potential solutions for those security issues when merging their own changes.

*Note* If enforced, outdated branches would not be able to be merged into their origin repository without first being updated to contain any recent changes.

## Audit

For each code repository in use, verify that open branches must be updated before merging is permitted.

## Remediation

For each code repository in use, enforce a policy to only allow merging open branches if they are current with the latest change from their origin repository.
