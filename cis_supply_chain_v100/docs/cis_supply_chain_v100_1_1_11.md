## Description

Organizations should enforce a "no open comments" policy before allowing code change merging.

## Rationale

In an open code change proposal, reviewers can leave comments containing their questions and suggestions. These comments can also include potential bugs and security issues. Requiring all comments on a code change proposal to be resolved before it can be merged ensures that every concern is properly addressed or acknowledged before the new code changes are introduced to the code base.

**Note**: Code change proposals containing open comments would not be able to be merged into the code base.

## Audit

For every code repository in use, verify that each merged code change does not contain open, unattended comments.

## Remediation

For each code repository in use, require open comments to be resolved before the relevant code change can be merged.
