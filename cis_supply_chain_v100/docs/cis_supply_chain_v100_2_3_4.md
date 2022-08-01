## Description

Track and review changes to pipeline files.

## Rationale

Pipeline files are sensitive files. They have the ability to access sensitive data and control the build process, thus it is just as important to review changes to pipeline files as it is to verify source code. Malicious actors can potentially add harmful code to these files,which may lead to sensitive data exposure and hijacking of the build environment or artifacts.

## Audit

For each pipeline file, ensure changes to it are being tracked and reviewed.

## Remediation

For each pipeline file, track changes to it and review them.
