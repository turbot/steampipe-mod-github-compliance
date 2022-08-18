## Description

Detect and prevent sensitive data, such as confidential ID numbers, passwords, etc., in pipelines.

## Rationale

Sensitive data in pipeline configuration, such as cloud provider credentials or repository credentials, create vulnerabilities with which malicious actors could steal such information if they gain access to a pipeline. In order to mitigate this, set scanners that will identify and prevent the existence of sensitive data in the pipeline.

## Audit

For every pipeline that is in use, verify that scanners are set to identify and prevent the existence of sensitive data within it.

## Remediation

For every pipeline that is in use, set scanners that will identify and prevent sensitive data within it.
