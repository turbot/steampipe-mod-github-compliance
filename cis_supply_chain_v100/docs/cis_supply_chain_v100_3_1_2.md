## Description

An SBOM is a file that specifies each component of software or a build process. Require an SBOM from every third-party provider.

## Rationale

An SBOM for every third-party artifact helps to ensure an artifact is safe to use and fully compliant. This file lists all important metadata, especially all the dependencies of an artifact, and allows for verification of each dependency. If one of the dependencies/artifacts is attacked or has a new vulnerability (e.g., the “SolarWinds” or even “log4j” attack), it is easier to detect what has been affected by this incident because dependencies in use are listed in the SBOM file.

## Audit

For every third-party dependency in use, ensure it has an SBOM.

## Remediation

For every third-party dependency in use, require an SBOM from its supplier.
