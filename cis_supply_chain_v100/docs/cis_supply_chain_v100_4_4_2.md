## Description

Proxy registries can proxy requests of internal packages to a public registry if grouped with an internal hosted registry. Block the option to request private packages from the proxy registry so that they will be pulled only from the hosted registry.

## Rationale

When a proxy registry receives a request for private packages, it looks for them within public registries. This can lead to potential name shadowing, meaning that if a malicious package has the same name as the internal one, it will therefore be pulled, which can lead to a massive breach or malevolent code running in private, closed environments. To protect the internal environment from such incidents, it is recommended to block the option to pull private packages from the proxy and public registries.

*Note* Public packages with similar names to private ones will not be able to be pulled.

## Audit

For every proxy registry in use, ensure the pulling of internal packages is blocked.

## Remediation

For each proxy registry in use, block the option to pull internal packages.
