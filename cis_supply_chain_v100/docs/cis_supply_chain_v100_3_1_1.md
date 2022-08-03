## Description

Ensure third-party artifacts and open-source libraries in use are trusted and verified.

## Rationale

Verify third-party artifacts used in code are trusted and have not been infected by a malicious actor before use. This can be accomplished, for example, by comparing the checksum of the dependency to its checksum in a trusted source. If a difference arises, this may be a sign that someone interfered and added malicious code. If this dependency is used, it will infect the environment and could end in a massive breach, leaving the organization exposed to data leaks and more.

## Audit

For every artifact and open-source library, ensure verification before use.

## Remediation

Verify every artifact and open-source library in use.
