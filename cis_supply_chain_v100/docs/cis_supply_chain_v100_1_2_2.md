## Description

Limit the ability to create repositories to trusted users and teams.

## Rationale

Restricting repository creation to trusted users and teams is recommended in order to keep the organization properly structured, track fewer items, prevent impersonation, and to not overload the version control system. It will allow administrators easier source code tracking and management capabilities, as they will have fewer repositories to track. The process of detecting potential attacks becomes far more straightforward, as well, since the easier it is to track the source code, the easier it is to detect malicious acts within it. Additionally, the possibility of a member creating a public repository and sharing the organization’s data externally is significantly decreased.

*Note* Specific users will not be permitted to create repositories.

## Audit

Verify that only trusted users and teams can create repositories.

## Remediation

Restrict repository creation to trusted users and teams only.
