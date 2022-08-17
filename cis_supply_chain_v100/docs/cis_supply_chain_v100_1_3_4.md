## Description

Require collaborators from outside the organization to use Multi-Factor Authentication (MFA) in addition to a standard user name and password when authenticating to the source code management platform.

## Rationale

By default, every user authenticates within the system by password only. If the password of a user is compromised, however, the user account and every repository to which they have access is in danger of data loss, malicious code commits, and data theft. It is therefore recommended that each user has Multi-Factor Authentication enabled. This adds an additional layer of protection to ensure the account remains secure even if the user’s password is compromised.

**Note** A member without enabled Multi-Factor Authentication cannot contribute to the project. They must enable Multi-Factor Authentication before they can contribute any code.

## Audit

For each repository in use, verify that Multi-Factor Authentication is enforced for contributors and is the only way to authenticate.

## Remediation

For each repository in use, enforce Multi-Factor Authentication as the only way to authenticate for contributors.
