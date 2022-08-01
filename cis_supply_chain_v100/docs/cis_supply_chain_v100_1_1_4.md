## Description

Ensure that when a proposed code change is updated, previous approvals are declined and new approvals are required.

## Rationale

An approval process is necessary when code changes are suggested. Through this approval process, however, changes can still be made to the original proposal even after some approvals have already been given. This means malicious code can find its way into the code base even if the organization has enforced a review policy. To ensure this is not possible, outdated approvals must be declined when changes to the suggestion are introduced.

*Note* If new code changes are pushed to a specific proposal, all previously accepted code change proposals must be declined.

## Audit

For each code repository in use, validate that each updated code suggestion declines the previously received approvals.

## Remediation

For each code repository in use, enforce an organization-wide policy to dismiss given approvals to code change suggestions if those suggestions were updated.
