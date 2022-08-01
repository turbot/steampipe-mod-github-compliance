## Description

Use pipeline as code for build pipelines and their defined steps.

## Rationale

Storing pipeline instructions as code in a version control system means automation of the build steps and less room for human error, which could potentially lead to a security breach Additionally, it creates the ability to revert to a previous pipeline configuration in order to pinpoint the affected change should a malicious incident occur.

## Audit

Verify that all build steps are defined as code and stored in a version control system.

## Remediation

Convert pipeline instructions into code-based syntax and upload them to the organization's version control platform.
