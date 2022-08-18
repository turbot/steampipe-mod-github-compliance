## Description

Enforce Multi-Factor Authentication (MFA) for user access to the package registry.

## Rationale

By default, every user authenticates to the system by password only. If a user's password is compromised, the user account and all its related packages are in danger of data theft and malicious builds. It is therefore recommended that each user enables Multi-Factor Authentication. This additional step guarantees that the account stays secure even if the user's password is compromised, as it adds another layer of authentication.

## Audit

For each package registry in use, verify that Multi-Factor Authentication is enforced and is the only way to authenticate.

## Remediation

For each package registry in use, enforce Multi-Factor Authentication as the only way to
authenticate.
