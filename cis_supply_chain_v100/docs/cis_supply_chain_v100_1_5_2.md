## Description

Detect and prevent misconfigurations and insecure instructions in Continuous Integration (CI) pipelines.

## Rationale

Detecting and fixing misconfigurations or insecure instructions in CI pipelines decreases the risk for a successful attack through or on the CI pipeline. The more secure the pipeline, the less risk there is for potential exposure of sensitive data, a deployment being compromised, or external access mistakenly being granted to the CI infrastructure or the source code.

## Audit

For every CI pipeline, verify that scanners are set to identify and prevent misconfigurations and insecure instructions.

## Remediation

For every CI pipeline, set scanners to identify and prevent misconfigurations and insecure instructions.
