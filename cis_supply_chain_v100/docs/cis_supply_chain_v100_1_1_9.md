## Description

Before a code change request can be merged to the code base, all predefined checks must successfully pass.

## Rationale

On top of manual reviews of code changes, a code protect should contain a set of prescriptive checks that validate each change. Organizations should enforce those status checks so that changes can only be introduced if all checks have successfully passed. This set of checks should serve as the absolute quality, stability, and security conditions that must be met in order to merge new code to a project.

**Note** Code changes in which all checks do not pass successfully would not be able to be pushed into the code base of the specific code repository.

## Audit

Ensure that for each code repository in use, status checks are required to pass before allowing any code change proposal merge.

## Remediation

Configure each code repository to require all status checks to pass before permitting a merge of new code.
