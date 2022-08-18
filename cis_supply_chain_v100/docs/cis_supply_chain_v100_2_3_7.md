## Description

Scan pipelines for vulnerabilities. It is recommended that this be implemented automatically.

## Rationale

Automatic scanning for vulnerabilities detects known vulnerabilities in pipeline instructions and components, allowing faster patching in case one is found. These vulnerabilities can lead to a potentially massive breach if not handled as fast as possible, as attackers might also be aware of such vulnerabilities.

## Audit

For each pipeline, verify that it is automatically scanned for vulnerabilities.

## Remediation

For each pipeline, set automated vulnerability scanning.
