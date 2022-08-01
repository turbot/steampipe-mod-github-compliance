## Description

External dependencies may be public packages needed in the pipeline, or perhaps the public image being used for the build worker. Lock these external dependencies in every build pipeline.

## Rationale

External dependencies are sources of code that are not under organizational control. They might be intentionally or unintentionally infected with malicious code or have known vulnerabilities, which could result in sensitive data exposure, data harvesting, or the erosion of trust in an organization. Locking each external dependency to a specific, safe version gives more control and less chance for risk.

## Audit

Ensure every external dependency being used in pipelines is locked.

## Remediation

For all external dependencies being used in pipelines, verify they are locked.
