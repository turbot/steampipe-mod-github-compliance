## Description

Detect and prevent sensitive data—such as confidential ID numbers, passwords, etc.—in deployment configurations.

## Rationale

Sensitive data in deployment configurations might create a major incident if an attacker gains access to it, as this can cause data loss and theft. It is important to keep sensitive data safe and to not expose it in the configuration. In order to prevent a possible exposure, set scanners that will identify and prevent such data in deployment configurations.

## Audit

For each deployment configuration file, verify that scanners are set to identify and prevent the existence of sensitive data within it.

## Remediation

For each deployment configuration file, set scanners to identify and prevent sensitive data within it.
