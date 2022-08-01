## Description

Disable anonymous access to artifacts.

## Rationale

Most artifact repositories support anonymous users, such as JFrog and Nexus. For unauthorized users, this defaults to a user with only read permissions, though more permissions may be added. Disable the option to view artifacts as "Anonymous User" in order to protect private artifacts from being exposed. This way, only trusted and authorized members will be able to access artifacts.

*Note* Only logged and authorized users will be able to access artifacts.

## Audit

For each artifact or package manager in use, verify that anonymous access is disabled.

## Remediation

Disable the anonymous access option on every artifact or package manager in use.
