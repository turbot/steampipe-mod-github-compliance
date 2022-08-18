## Description

An SBOM is a file that specifies each component of software or a build process. It should be generated after every pipeline run. After it is generated, it must then be signed.

## Rationale

An SBOM is a file used to validate the integrity and security of a build pipeline. Signing it ensures that no one tampered with the file when it was delivered. Such interference can happen if someone tries to hide unusual activity. Validating the SBOM signature can detect this activity and prevent much greater incident.

## Audit

For each pipeline, ensure it signs the SBOM it produces on every run.

## Remediation

For each pipeline, configure it to sign its produced SBOM on every run.
