## Description

Manage users and their access to the package registry with an external authentication server and not with the package registry itself.

## Rationale

Some package registries offer a tool for user management, aside from the main Lightweight Directory Access Protocol (LDAP) or Active Directory (AD) server of the organization. That tool usually offers simple authentication and role-based permissions, which might not be granular enough. Having multiple user management tools in the organization could result in confusion and privilege escalation, as there will be more to manage. To avoid a situation where users escalate their privileges because someone missed them, manage user access to the package registry via the main authentication server and not locally on the package registry.

## Audit

For each package registry, verify that its user access is not managed locally, but instead with the main authentication server of the organization.

## Remediation 

For each package registry, use the main authentication server of the organization for user management and do not manage locally.
