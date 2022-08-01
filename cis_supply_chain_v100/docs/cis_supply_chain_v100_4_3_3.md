## Description

Audit changes of the package registry configuration.

## Rationale

The package registry is a crucial component in the software supply chain. It stores artifacts with potentially sensitive data that will eventually be deployed and used in production. Every change made to the package registry configuration must be examined carefully to ensure no exposure of the registry's sensitive data. This examination also ensures no malicious actors have performed modifications to a stored artifact. Auditing the configuration and its changes helps in decreasing such risks.

## Audit

Verify that all changes to the package registry configuration are audited.

## Remediation

Audit the changes to the package registry configuration.
