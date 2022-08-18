## Description

Code owners are trusted users that are responsible for reviewing and managing an important piece of code or configuration. An organization is advised to set code owners for every extremely sensitive code or configuration.

## Rationale

Configuring code owners protects data by verifying that trusted users will notice and review every edit, thus preventing unwanted or malicious changes from potentially compromising sensitive code or configurations.

**Note**: Code owner users will receive notifications for every change that occurs to the code and subsequently added as reviewers of pull requests automatically.

## Audit

For every code repository in use, ensure code owners are set for sensitive code or configuration.

## Remediation

For every code repository in use, identify particularly sensitive parts of code and configurations and set trusted users to be their code owners.
