## Description

Use packages that are more than 60 days old.

## Rationale

Third-party packages are a major risk since an organization cannot control their source code, and there is always the possibility these packages could be malicious. It is therefore good practice to remain cautious with any third-party or open-source package, especially new ones, until they can be verified that they are safe to use. Avoiding a new package allows the organization to fully examine it, its maintainer, and its behavior, and gives enough time to determine whether or not to use it.

*Note* Developers may not use packages that are less than 60 days old.

## Audit

For every package used, ensure it is more than 60 days old.

## Remediation

If a package used is less than 60 days old, stop using it and find another solution.
