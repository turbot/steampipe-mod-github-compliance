## Description

Audit and track changes made in deployment configuration.

## Rationale

Deployment configuration is sensitive in nature. The tiniest mistake can lead to downtime or bugs in production, which consequently may have a direct effect on both product integrity and customer trust. Misconfigurations might also be used by malicious actors to attack the production platform. Because of this, every change in the configuration needs a review and possible "revert" in case of a mistake or malicious change. Auditing every change and tracking them helps detect and fix such incidents more quickly.

## Audit

For each deployment configuration, ensure changes made to it are audited and tracked.

## Remediation

For each deployment configuration, track and audit changes made to it.
