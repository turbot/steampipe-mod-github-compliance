## Description

Restrict access to pipeline triggers.

## Rationale

Build pipelines are used for multiple reasons. Some are very sensitive, such as pipelines that deploy to production. In order to protect the environment from malicious acts or human mistakes, such as a developer deploying a bug to production, it is important to apply the "principle of least privilege" to pipeline triggering. This principle requires restrictions placed on which users can run which pipeline. It allows for sensitive pipelines to only be run by administrators, who are generally the most trusted and skilled members of the organization.

## Audit

For every pipeline in use, verify only the necessary users have permission to trigger it.

## Remediation

For every pipeline in use, grant only the necessary users permission to trigger it.
