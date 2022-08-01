## Description

Configure the build pipeline to sign every artifact it produces and verify that each artifact has the appropriate signature.

## Rationale

A cryptographic signature can be used to verify artifact authenticity. The signature created with a certain key is unique and not reversible, thus making it unique to the author. This means that an attacker tampering with a signed artifact will be noticed immediately using a simple verification step because the signature will change. Signing artifacts by the build pipeline that produces them ensures the integrity of those artifacts.

## Audit

Verify that the build pipeline signs every new artifact it produces and all artifacts are signed.

## Remediation

Sign every artifact produced with the build pipeline that created it. Configure the build pipeline to sign each artifact.
