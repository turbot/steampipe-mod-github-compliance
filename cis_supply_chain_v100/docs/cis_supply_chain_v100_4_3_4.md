## Description

Use secured webhooks of the package registry.

## Rationale

Webhooks are used for triggering an HTTP request based on an action made in the platform. Typically, package registries feature webhooks when a package receives an update. Since webhooks are an HTTP POST request, they can be malformed if not secured over SSL. To prevent a potential hack and compromise of the webhook or to the registry or web server accepting the request, use only secured webhooks.

## Audit

For each webhook in use, ensure it is secured (HTTPS).

## Remediation

For each webhook in use, change it to secured (over HTTPS).
