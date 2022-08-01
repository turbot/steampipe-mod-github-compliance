## Description

Ensure installed application permissions are limited to the lowest privilege level required.

## Rationale

Applications are typically automated integrations that can improve the workflow of an organization. They are written by third-party developers and therefore should be reviewed carefully before use. It is recommended to use the "principle of least privilege," granting applications the lowest level of permissions required. This may prevent harm from a potentially malicious application with unnecessarily high-level permissions leaking data or modifying source code.

## Audit

Verify that each installed application has the least privilege needed.

## Remediation

Grant permissions to applications by the "principle of least privilege," meaning the lowest possible permission necessary.
