## Description

Write pipeline output artifacts to a secured storage repository.

## Rationale

To maintain output artifacts securely and reduce the potential surface for attack, store such artifacts separately in secure storage. This separation enforces the Single Responsibility Principle by ensuring the orchestration platform will not be the same as the artifact storage, which reduces the potential harm of an attack. Using the same security considerations as the input (for example, the source code) will protect artifacts stored and will make it harder for a malicious actor to successfully execute an attack.

## Audit

For each pipeline that produces output artifacts, ensure that they are written to a secured storage repository.

## Remediation

For each pipeline that produces output artifacts, write them to a secured storage repository.
