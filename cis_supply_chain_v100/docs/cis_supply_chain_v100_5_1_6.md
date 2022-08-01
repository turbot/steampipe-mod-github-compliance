## Description

Verify the deployment configuration manifests.

## Rationale

To ensure that the configuration manifests used are trusted and have not been infected by malicious actors before arriving at the platform, it is important to verify the manifests. This may be done by comparing the checksum of the manifest file to its checksum in a trusted source. If a difference arises, this is a sign that an unknown actor has interfered and may have added malicious instructions. If this manifest is used, it might harm the environment and application deployment, which could end in a massive breach and leave the organization exposed to data leaks, etc.

## Audit

For each deployment configuration manifest in use, ensure it has been verified.

## Remediation

Verify each deployment configuration manifest in use.
