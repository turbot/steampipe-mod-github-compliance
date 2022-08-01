## Description

Detect and prevent misconfigurations or insecure instructions in Infrastructure as Code (IaC) files, such as Terraform files.

## Rationale

Detecting and fixing misconfigurations and/or insecure instructions in IaC (Infrastructure as Code) files decreases the risk for data leak or data theft. It is important to secure IaC instructions in order to prevent further problems of deployment, exposed assets, or improper configurations, which can ultimately lead to easier ways to attack and steal organization data.

## Audit

For every IaC instructions file, verify that scanners are set to identify and prevent misconfigurations and insecure instructions.

## Remediation

For every IaC instructions file, set scanners to identify and prevent misconfigurations and insecure instructions.
