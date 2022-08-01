## Description

Deployment configuration is often stored in a version control system and is pulled from there. Pin the configuration used to a specific, verified version or commit Secure Hash Algorithm (SHA). Avoid referring configuration without its version tag specified.

## Rationale

Deployment configuration manifests are often stored in version control systems and pulled from there either by automation platforms, such as Ansible, or GitOps platforms, such as Argo CD. When a manifest is pulled from a version control system without tag or commit Secure Hash Algorithm (SHA) specified, it is pulled from the HEAD revision, which is equal to the "latest" tag, and pulls the last change made. This increases the risk of encountering a new, potentially malicious configuration. If an attacker pushes malicious configuration to the version control system, the next user who pulls the HEAD revision will pull it and risk attack. To avoid that risk, use a version tag of the verified version or a commit SHA of a trusted commit, which will ensure this is the only version pulled.

*Note*: Changes in deployment configuration will not be pulled unless their version tag or commit Secure Hash Algorithm (SHA) is specified. This might slow down the deployment process.

## Audit

For every deployment configuration manifest in use, ensure it is pinned to a specific version or commit Secure Hash Algorithm (SHA).

## Remediation

For every deployment configuration manifest in use, pin to a specific version or commit Secure Hash Algorithm (SHA).
