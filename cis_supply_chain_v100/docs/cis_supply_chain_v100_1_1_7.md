## Description

Ensure trusted code owners are required to review and approve any code change proposal made to their respective owned areas in the code base.

## Rationale

Configuring code owners ensures that no code, especially code that could prove malicious, will slip into the source code or configuration files of a repository. This allows an organization to mark areas in the code base that are especially sensitive or more prone to an attack. It can also enforce review by specific individuals who are designated as owners to those areas so that they may filter out unauthorized or unwanted changes beforehand.

*Note* If an organization enforces code owner-based reviews, some code change proposals would not be able to be merged to the code base before specific, trusted individuals approve them.

## Audit

For each repository in use, verify that code owners are required to review all code change proposals relevant to areas they own.

## Remediation

For each repository in use, configure code owner-required approvals for each change proposal related to code they own.
