## Description

Ensure only trusted and responsible users can delete issues.

## Rationale

Issues are a way to keep track of things happening in repositories, such as setting new milestones or requesting urgent fixes. Deleting an issue is not a benign activity, as it might harm the development workflow or attempt to hide malicious behavior. Because of this, it should be restricted and allowed only by trusted and responsible users.

**Note**: Certain users will not be permitted to delete issues.

## Audit

Verify that only trusted and responsible users can delete issues.

## Remediation

Restrict issue deletion to a few trusted and responsible users only.
