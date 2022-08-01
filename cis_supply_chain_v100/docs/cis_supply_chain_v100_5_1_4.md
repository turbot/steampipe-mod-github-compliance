## Description

Restrict access to the deployment configuration to trusted and qualified users only.

## Rationale

Deployment configurations are sensitive in nature. The tiniest mistake can lead to downtime or bugs in production, which can have a direct effect on the product's integrity and customer trust. Misconfigurations might also be used by malicious actors to attack the production platform. To avoid such harm as much as possible, ensure only trusted and qualified users have access to such configurations. This will also reduce the number of accounts that might affect the environment in case of an attack.

*Note* Reducing the number of users who have access to the deployment configuration means those users would lose their ability to make direct changes to that configuration.

## Audit

Verify each deployment configuration is accessible only to known and authorized users.

## Remediation

Restrict access to the deployment configuration to trusted and qualified users.
