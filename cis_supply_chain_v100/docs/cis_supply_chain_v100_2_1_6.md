## Description

Require users to log in to access the build environment—the orchestrator, the pipeline executer, where the build workers are running, etc.

## Rationale

Requiring users to authenticate, and disabling anonymous access to the build environment, allows an organization to track every action on that environment, good or bad, to its actor. This will help in recognizing an attack and its attacker because authentication is required.

*Note* Anonymous users will not be able to access the build environment.

## Audit

Ensure authentication is required to access the build environment.

## Remediation

Require authentication to access the build environment and disable anonymous access.
