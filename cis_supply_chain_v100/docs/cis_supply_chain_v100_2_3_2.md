## Description

Define clear expected input and output for each build stage.

## Rationale

In order to have more control over data flow in the build pipeline, clearly define the input and output of the pipeline steps. If anything malicious happens during the build stage, it will be recognized more easily and stand out as an anomaly.

## Audit

For each build stage, verify that the expected input and output are clearly defined.

## Remediation

For each build stage, clearly define what is expected for input and output.
