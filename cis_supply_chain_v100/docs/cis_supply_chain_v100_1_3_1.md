## Description

Track inactive user accounts and periodically remove them.

## Rationale

User accounts that have been inactive for a long period of time are enlarging the surface of attack. Inactive users with high-level privileges are of particular concern, as these accounts are more likely to be targets for attackers. This could potentially allow access to large portions of an organization should such an attack prove successful. It is recommended to remove them as soon as possible in order to prevent this.

## Audit

For each repository in use, verify that all user accounts are active.

## Remediation

For each repository in use, review inactive user accounts (members that left the organization, etc.) and remove them.
