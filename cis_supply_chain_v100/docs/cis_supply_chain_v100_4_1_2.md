## Description

Encrypt artifacts before they are distributed and ensure only trusted platforms have decryption capabilities.

## Rationale

Build artifacts might contain sensitive data such as production configurations. In order to protect them and decrease the risk for breach, it is recommended to encrypt them before delivery. Encryption makes data unreadable, so even if attackers gain access to these artifacts, they will not be able to harvest sensitive data from them without the decryption key.

## Audit

Ensure every artifact is encrypted before it is delivered.

## Remediation

Encrypt every artifact before distribution.
