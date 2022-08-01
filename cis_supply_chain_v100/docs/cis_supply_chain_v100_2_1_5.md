## Description

Restrict access to the build environment (orchestrator, pipeline executor, their environment, etc.) to trusted and qualified users only.

## Rationale

A build environment contains sensitive data such as environment variables, secrets, and the source code itself. Any user that has access to this environment can make changes to the build process, including changes to the code within it. Restricting access to the build environment to trusted and qualified users only will reduce the risk for mistakes such as exposure of secrets or misconfiguration. Limiting access also reduces the number of accounts that are vulnerable to hijacking in order to potentially harm the build environment. 

*Note* Reducing the number of users who have access to the build process means those users would lose their ability to make direct changes to that process.

## Audit

Verify each build environment is accessible only to known and authorized users.

## Remediation

Restrict access to the build environment to trusted and qualified users.
