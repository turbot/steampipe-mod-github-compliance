## Description

Validate artifact signatures before uploading to the package registry.

## Rationale

Cryptographic signature is a tool to verify artifact authenticity. Every artifact is supposed to be signed by its creator in order to confirm that it was not compromised before reaching the client. Validating an artifact signature before delivering it is another level of protection that ensures the signature has not been changed, meaning no one tried or succeeded in tampering with the artifact. This creates trust between the supplier and the client.

## Audit

Ensure every artifact in the package registry has been validated with its signature.

## Remediation

Validate every artifact with its signature before uploading it to the package registry. It is recommended to do so automatically.
