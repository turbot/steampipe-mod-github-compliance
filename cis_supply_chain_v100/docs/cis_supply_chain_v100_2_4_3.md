## Description

Validate every dependency of the pipeline before use.

## Rationale

To ensure that a dependency used in a pipeline is trusted and has not been infected by a malicious actor (e.g., the Codecov incident), validate dependencies before using them. This can be accomplished by comparing the checksum of the dependency to its checksum in a trusted source. If a difference arises, this is a sign that an unknown actor has interfered and may have added malevolent code. If this dependency is used, it will infect the environment, which could end in a massive breach and leave the organization exposed to data leaks, etc.

## Audit

For every dependency used in every pipeline, ensure it has been validated.

## Remediation

For every dependency used in every pipeline, validate each one.
