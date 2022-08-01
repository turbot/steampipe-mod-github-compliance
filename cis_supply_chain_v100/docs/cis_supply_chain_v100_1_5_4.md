## Description

Detect and prevent known open-source vulnerabilities in the code.

## Rationale

Open-source code blocks are used a lot in developed software. This has its own advantages, but it also has risks. Because the code is open for everyone, attackers can publish or add malicious code to these open-source code blocks, or use their knowledge to find vulnerability in an existing code. Detecting and fixing such code vulnerabilities by SCA (software composition analysis) prevents insecure flaws from reaching production. It gives another opportunity for developers to secure the source code before it is deployed in production where it is far more exposed and vulnerable to attacks.

## Audit

For every repository that is in use, verify that scanners are set to identify and prevent code vulnerabilities.

## Remediation

For every repository that is in use, set scanners that will identify and prevent code vulnerabilities.
