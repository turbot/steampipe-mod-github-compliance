## Description

Require members of the organization to use Multi-Factor Authentication (MFA) in addition to a standard user name and password when authenticating to the source code management platform.

## Rationale

By default, every user authenticates within the system by password only. If the password of a user is compromised, however, the user account and every repository to which they have access is in danger of data loss, malicious code commits, and data theft. It is therefore recommended that each user has Multi-Factor Authentication enabled. This adds an additional layer of protection to ensure the account remains secure even if the user’s password is compromised.

*Note* Members could be removed from the organization if they do not have Multi-Factor Authentication already enabled. If this is the case, it is recommended that an invitation be sent to reinstate the user’s access and former privileges. They must enable Multi-Factor Authentication in order to accept the invitation.

## Audit

For every organization that exists in your source code management platform, verify that Multi-Factor Authentication is enforced and is the only way to authenticate.

## Remediation

Use the built-in setting to ensure the enforcement of Multi-Factor Authentication for each member of the organization.
