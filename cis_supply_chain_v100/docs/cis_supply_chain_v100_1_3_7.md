## Description

Ensure every repository has two users with administrative permissions.

## Rationale

Repository administrators have the highest permissions to said repository. These include the ability to add/remove collaborators, change branch protection policy, and convert to a publicly accessible repository. Due to the liberal access granted to a repository administrator, it is highly recommended that only two contributors occupy this role.

**Note** Removing administrative users from a repository would result in them losing high-level access to that repository.

## Audit

For every repository in use, verify there are two administrators.

## Remediation

For every repository in use, set two administrators.
