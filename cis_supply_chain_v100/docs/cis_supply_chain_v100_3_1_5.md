## Description

Prioritize trusted package registries over others when pulling a package.

## Rationale

When pulling a package by name, the package manager might look for it in several package registries, some of which may be untrusted or badly configured. If the package is pulled from such a registry, there is a higher likelihood that it could prove malicious. In order to avoid this, configure packages to be pulled from trusted package registries.

## Audit

For each package registry in use, ensure it is trusted.

## Remediation

For each package to be downloaded, configure it to be downloaded from a trusted source.
