## Description

Base permissions define the permission level automatically granted to all organization members. Define strict base access permissions for all of the repositories in the organization, including new ones.

## Rationale

Defining strict base permissions is the best practice in every role-based access control (RBAC) system. If the base permission is high—for example, "Write" permission—every member of the organization will have "Write" permission to every repository in the organization. This will apply regardless of the specific permissions a user might need, which generally differ between organization repositories. The higher the permission, the higher the risk for incidents such as bad code commit or data breach. It is therefore recommended to set the base permissions to the strictest level possible.

**Note** Users might not be able to access organization repositories or perform some acts as commits. These specific permissions should be granted individually for each user or team, as needed.

## Audit

Verify that strict base permissions are set for the organization repositories—either "None"
or "Read."

## Remediation

Set strict base permissions for the organization repositories—either "None" or "Read."
