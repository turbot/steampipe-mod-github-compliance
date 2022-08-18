## Description

Pin dependencies to a specific version. Avoid using the "latest" tag or broad version.

## Rationale

When using a wildcard version of a package, or the "latest" tag, the risk of encountering a new, potentially malicious package increases. The "latest" tag pulls the last package pushed to the registry. This means that if an attacker pushes a new, malicious package successfully to the registry, the next user who pulls the "latest" will pull it and risk attack. This same rule applies to a wildcard version. Assuming one is using version v1.*, it will install the latest version of the major version 1, meaning that if an attacker can push a malicious package with that same version, those using it will be subject to possible attack. By using a secure, verified version, use is restricted to this version only and no other may be pulled, decreasing the risk for any malicious package.

## Audit

For every dependency in use, ensure it is pinned to a specific version.

## Remediation

For every dependency in use, pin to a specific version.
