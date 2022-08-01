## Description

Keep track of code branches that are inactive for a lengthy period of time and periodically remove them.

## Rationale

Git branches that have been inactive (i.e., no new changes introduced) for a long period of time are enlarging the surface of attack for malicious code injection, sensitive data leaks, and CI pipeline exploitation. They potentially contain outdated dependencies that may leave them highly vulnerable. They are more likely to be improperly managed, and could possibly be accessed by a large number of members of the organization.

*Note* Removing inactive Git branches means that any code changes they contain would be removed along with them, thus work done in the past might not be accessible after auditing for inactivity.

## Audit

For each code repository in use, verify that all existing Git branches are active or have yet to be checked for inactivity within a specified period.

## Remediation

For each code repository in use, review existing Git branches and remove those that have not been active for a prescribed period.
