## Description

Verify that the build pipeline creates reproducible artifacts, meaning that an artifact of the build pipeline is the same in every run when given the same input.

## Rationale

A reproducible build is a build that produces the same artifact when given the same input data. Ensuring that the build pipeline produces the same artifact when given the same input helps verify that no change has been made to the artifact. This action allows an organization to trust that its artifacts are built only from safe code that has been reviewed and tested and has not been tainted or changed abruptly.

## Audit

Ensure that build pipelines create reproducible artifacts.

## Remediation

Create build pipelines that produce the same artifact given the same input (for example, artifacts that do not rely on timestamps).
