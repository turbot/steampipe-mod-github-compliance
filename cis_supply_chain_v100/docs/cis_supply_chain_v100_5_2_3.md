## Description

Restrict access to the production environment to a few trusted and qualified users only.

## Rationale

The production environment is an extremely sensitive one. It directly affects the customer experience and trust in a product, which has serious effects on the organization itself. Because of this sensitive nature, it is important to restrict access to the production environment to only a few trusted and qualified users. This will reduce the risk of mistakes such as exposure of secrets or misconfiguration. This restriction also reduces the number of accounts that are vulnerable to hijacking in order to potentially harm the production environment.

*Note* Reducing the number of users who have access to the production environment means those users would lose their ability to make direct changes to that environment.

## Audit

Verify that the production environment is accessible only to trusted and qualified users.

## Remediation

Restrict access to the production environment to trusted and qualified users.
