## Description

Ensure the pipeline orchestrator and its configuration are immutable.

## Rationale

An immutable infrastructure is one that cannot be changed during execution of the pipeline. This can be done, for example, by using Infrastructure as Code for configuring the pipeline and the pipeline environment. Utilizing such infrastructure creates a more predictable environment because updates will require redeployment to prevent any previous configuration from interfering. Because it is dependent on automation, it is easier to revert changes. Testing code is also simpler because it is based on virtualization. Most importantly, an immutable pipeline infrastructure ensures that a potential attacker seeking to compromise the build environment itself would not be able to do so if the orchestrator, its configuration, and any other component cannot be changed. Verifying that all aspects of the pipeline infrastructure and configuration are immutable, therefore, keeps them safe from malicious tampering attempts.

## Audit

Verify that the pipeline orchestrator, its configuration, and all other aspects of the build environment are immutable.

## Remediation

Use an immutable pipeline orchestrator, and ensure that its configuration and all other aspects of the build environment are immutable as well.
