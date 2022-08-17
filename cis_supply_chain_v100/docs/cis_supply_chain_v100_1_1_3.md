## Description

Ensure that every code change is reviewed and approved by two authorized contributors who are both strongly authenticated, from the team relevant to the code change.

## Rationale

To prevent malicious or unauthorized code changes, the first layer of protection is the process of code review. This process involves engineer teammates reviewing each other’s code for errors, optimizations, and general knowledge-sharing. With proper peer reviews in place, an organization can detect unwanted code changes very early in the process of release. In order to help facilitate code review, companies should employ automation to verify that every code change has been reviewed and approved by at least two team members before it is pushed into the code base. These team members should be from the team that is related to the code change, so it will be a meaningful review.

***Note*** To enforce a code review requirement, verification for a minimum of two reviewers must be put into place. This will ensure new code will not be able to be pushed to the code base before it has received two independent approvals.

## Audit

For every code repository in use, verify that two approvals from the specific code repository team are required in order to push new code to the code base.

## Remediation

An organization can protect specific code branches—for example, the "main" branch, which often is the version deployed to production—by setting protection rules. These rules secure your code repository from unwanted or unauthorized changes. You may set requirements for any code change to that branch, and thus specify a minimum number of reviewers required to approve a change.
