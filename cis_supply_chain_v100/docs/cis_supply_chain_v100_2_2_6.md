## Description

Scan build workers for vulnerabilities. It is recommended that this be done automatically.

## Rationale

Automatic scanning for vulnerabilities detects known weaknesses in environmental sources in use, such as docker images or kernel versions. Such vulnerabilities can lead to a massive breach if these environments are not replaced as fast as possible, since attackers also know about these vulnerabilities and often try to take advantage of them. Setting automatic scanning that scans environmental sources ensures that if any new vulnerability is revealed, it can be replaced quickly and easily. This protects the worker from being exposed to attacks.

## Audit

For each build worker, ensure the environmental sources it uses are scanned for vulnerabilities.

## Remediation

For each build worker, automatically scan its environmental sources, such as docker images, for vulnerabilities.
