## Description

Ensure that changes in the branch protection rules are audited.

## Rationale

Branch protection rules should be configured on every repository. The only users who may change such rules are administrators. In a case of an attack on an administrator account or of human error on the part of an administrator, protection rules could be disabled, and thus decrease source code confidentiality as a result. It is important to track and audit such changes to prevent potential incidents as soon as possible.

## Audit

Ensure a tracking system is in place that logs changes in branch protection rules (webhooks, etc.).

## Remediation

Use, maintain, or create a tracking system that tracks changes in branch protection rules (webhooks, etc.).
