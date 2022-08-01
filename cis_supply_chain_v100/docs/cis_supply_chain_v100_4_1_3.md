## Description

Grant decryption capabilities of artifacts only to trusted and authorized platforms.

## Rationale

Build artifacts might contain sensitive data such as production configuration. To protect them and decrease the risk of a breach, it is recommended to encrypt them before delivery. This will make them unreadable for every unauthorized user who does not have the decryption key. By implementing this, the decryption capabilities become overly sensitive in order to prevent a data leak or theft. Ensuring that only trusted and authorized platforms can decrypt the organization’s packages decreases the possibility for an attacker to gain access to the critical data in artifacts.

## Audit

Ensure only trusted and authorized platforms have decryption capabilities of the organization's artifacts.

## Remediation

Grant decryption capabilities of the organization's artifacts only for trusted and authorized
platforms.
