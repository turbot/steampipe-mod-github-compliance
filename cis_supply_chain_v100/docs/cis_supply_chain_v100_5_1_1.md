## Description

Deployment configurations are often stored in a version control system. Separate deployment configuration files from source code repositories.

## Rationale

Deployment configuration manifests are often stored in version control systems. Storing them in dedicated repositories, separately from source code repositories, has several benefits. First, it adds order to both maintenance and version control history. This makes it easier to track code or manifest changes, as well as spot any malicious code or misconfigurations. Second, it helps achieve the "principle of least privilege." Because access can be configured differently for each repository, fewer users will have access to this configuration, which is typically sensitive.

## Audit

Ensure each deployment configuration file is stored separately from source code.

## Remediation

Store each deployment configuration file in a dedicated repository separately from source code.
