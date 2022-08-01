## Description

Limit the ability to create teams to trusted and specific users.

## Rationale

The ability to create new teams should be restricted to specific members in order to keep the organization orderly and ensure users have access to only the lowest privilege level necessary. Teams typically inherit permissions from their parent team; thus, if base permissions are less restricted and any user has the ability to create a team, a permission leverage could occur in which certain data is made available to users who should not have access to it. Such a situation could potentially lead to the creation of shadow teams by an attacker. Restricting team creation will also reduce additional clutter in the organizational structure, and as a result will make it easier to track changes and anomalies.

*Note* Only specific users will be able to create new teams.

## Audit

For every organization, ensure that team creation is limited to specific, trusted users.

## Remediation

For every organization, limit team creation to specific, trusted users.
