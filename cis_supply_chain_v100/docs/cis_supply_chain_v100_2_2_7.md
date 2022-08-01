## Description

Store the deployment configuration of build workers in a version control platform, such as Github.

## Rationale

Build workers are a sensitive part of the build phase. They generally have access to the code repository, the Continuous Integration platform, the deployment platform, etc. This means that an attacker gaining access to a build worker may compromise other platforms in the organization and cause a major incident. One thing that can protect workers is to ensure that their deployment configuration is safe and well-configured. Storing the deployment configuration in version control enables more observability of these configurations because everything is catalogued in a single place. It adds another layer of security, as every change will be reviewed and noticed, and thus malicious changes will theoretically occur less. In the case of a mistake, bug, or security incident, it also offers an easier way to “revert” back to a safe version or add a “hot fix” quickly.

*Note* Changes in deployment configuration may only be applied by declaration in the version control platform. This could potentially slow down the development process.

## Audit

Verify that the deployment configuration of build workers is stored in a version control platform.

## Remediation

Document and store every deployment configuration of build workers in a version control platform.
