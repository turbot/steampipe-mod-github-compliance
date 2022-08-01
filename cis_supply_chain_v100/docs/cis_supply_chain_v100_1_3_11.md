## Description

As an organization, become an SSH Certificate Authority (CA) and provide SSH keys for accessing repositories.

## Rationale

There are two ways for remotely working with Source Code Management: via HTTPS, which requires authentication by user/password, or via SSH, which requires the use of SSH keys. SSH authentication is better in terms of security; key creation and distribution, however, must be done in a secure manner. This can be accomplished by implementing SSH certificates, which are used to validate the server's identity. A developer will not be able to connect to a Git server if its key cannot be verified by the SSH Certificate Authority (CA) server. As an organization, one can verify the SSH certificate signature used to authenticate if a CA is defined and used. This ensures that only verified developers can access organization repositories, as their SSH key will be the only one signed by the CA certificate. This reduces the risk of misuse and malicious code commits.

*Note* Members with unverified keys will not be able to clone organization repositories. Signing, certification, and verification might also slow down the development process.

## Audit

Verify that the organization has an SSH Certificate Authority server and provides an SSH certificate with which to sign keys.

## Remediation

Deploy an SSH Certificate Authority server and configure it to provide an SSH certificate with
which to sign keys.
