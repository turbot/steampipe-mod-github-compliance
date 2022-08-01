## Description

Detect, prevent and monitor known open-source vulnerabilities in packages that are being used.

## Rationale

Open-source vulnerabilities might exist before one starts to use a package, but they are also discovered over time. New attacks and vulnerabilities are announced every now and then. It is important to keep track of these and to monitor whether the dependencies used are affected by the recent vulnerability. Detecting and fixing those packages' vulnerabilities decreases the attack surface within deployed and running applications that use such packages. It prevents security flaws from reaching the production environment that could eventually lead to a security breach.

## Audit

For every repository that is in use, verify that scanners are set to monitor, identify, and prevent open-source vulnerabilities in packages.

## Remediation

For every repository that is in use, set scanners that will monitor, identify, and prevent open-source vulnerabilities in packages.
