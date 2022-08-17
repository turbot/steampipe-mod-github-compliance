## Description

Only trusted users should be allowed to dismiss code change reviews.

## Rationale

Dismissing a code change review permits users to merge new suggested code changes without going through the standard process of approvals. Controlling who can perform this action will prevent malicious actors from simply dismissing the required reviews to code changes and merging malicious or dysfunctional code into the code base.

**Note** In cases where a code change proposal has been updated since it was last reviewed and the person who reviewed it is not available for approval, a general collaborator would not be able to merge their code changes until a user with "dismiss review" abilities could dismiss the open review. Users who are not allowed to dismiss code change reviews will not be permitted to do so, and thus are unable to waive the standard flow of approvals.

## Audit

For each code repository in use, ensure that only trusted users are allowed to dismiss code change reviews.

## Remediation

For each code repository in use, do not grant the permission to dismiss code change reviews unless it is really necessary. If it is obligatory, carefully select the individual collaborators or groups whom you trust with the ability to dismiss code change reviews.
