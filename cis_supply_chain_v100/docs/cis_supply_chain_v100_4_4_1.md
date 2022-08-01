## Description

When delivering artifacts, ensure they have information about their origin. This may be done by providing an SBOM or some metadata files.

## Rationale

Information about artifact origin can be used for verification purposes. Having this kind of information allows the user to decide if the organization supplying the artifact is trusted. In a case of potential vulnerability or version update, this can be used to verify that the organization issuing it is the actual organization of origin and not someone else. If users need to report problems with the artifact, they will have an address to contact as well.

## Audit

For each artifact, ensure it has information about its origin.

## Remediation

For each artifact supplied, provide information about its origin. For each artifact in use, ask for information about its origin.
