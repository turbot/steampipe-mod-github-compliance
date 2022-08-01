## Description

An SBOM is a file that specifies each component of software or a build process. Generate an SBOM after each run of a pipeline.

## Rationale

Generating an SBOM after each run of a pipeline will validate the integrity and security of that pipeline. Recording every step or component role in the pipeline ensures that no malicious acts have been committed during the pipeline’s run.

## Audit

For each pipeline, ensure it produces an SBOM on every run.

## Remediation

For each pipeline, configure it to produce an SBOM on every run.
