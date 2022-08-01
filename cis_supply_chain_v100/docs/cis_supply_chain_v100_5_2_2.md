## Description

Verify that the deployment environment—the orchestrator and the production environment where the application is deployed—is reproducible. This means that the environment stays the same in each deployment if the configuration has not changed.

## Rationale

A reproducible build is a build that produces the same artifact when given the same input data, and in this case the same environment. Ensuring that the same environment is produced when given the same input helps verify that no change has been made to it. This action allows an organization to trust that its deployment environment is built only from safe code and configuration that has been reviewed and tested and has not been tainted or changed abruptly.

## Audit

Verify that the deployment/production environment is reproducible.

## Remediation

Adjust the process that deploys the deployment/production environment to build the same environment each time when the configuration has not changed.
