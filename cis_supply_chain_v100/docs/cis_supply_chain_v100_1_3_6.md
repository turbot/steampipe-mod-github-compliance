## Description

Existing members of an organization can invite new members to join; however, new members must only be invited with their company-approved email.

## Rationale

Ensuring new members of an organization have company-approved email prevents existing members of the organization from inviting arbitrary new users to join. Without this verification, they can invite anyone who is using the organization's version control system or has an active email account, thus allowing outside users (and potential threat actors) to easily gain access to company private code and resources. This practice will subsequently reduce the chance of human error or typos when inviting a new member.

*Note* Existing members would not be able to invite new users who do not have a company-approved email address.

## Audit

For each organization in use, verify for every invitation that the invited email address is company-approved.

## Remediation

For each organization, allow only users with company-approved email to be invited. If a user was invited without company-approved email, cancel the invitation and investigate the reason they were invited.
