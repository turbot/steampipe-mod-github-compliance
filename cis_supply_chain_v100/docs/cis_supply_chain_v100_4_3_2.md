## Description

Validate the signatures of all versions of an existing artifact.

## Rationale

In order to be certain a version of an existing and trusted artifact is not malicious or delivered by someone looking to interfere with the supply chain, it is a good practice to validate the signatures of each version. Doing so decreases the risk of using a compromised artifact, which might lead to a breach.

## Audit

For each artifact, ensure that all of its versions are signed and validated before it is uploaded or used.

## Remediation

For each artifact, sign and validate each version before uploading or using the artifact.
