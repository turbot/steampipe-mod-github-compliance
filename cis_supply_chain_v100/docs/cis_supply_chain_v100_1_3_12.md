## Description

Limit Git access based on IP addresses by having an allowlist of IP addresses from which connection is possible.

## Rationale

Allowing access to Git repositories (source code) only from specific IP addresses adds yet another layer of restriction and reduces the risk of unauthorized connection to the organization's assets. This will prevent attackers from accessing Source Code Management (SCM), as they would first need to know the allowed IP addresses to gain access to them.

*Note* Only members with whitelisted IP addresses will be able to access the organization's Git repositories.

## Audit

For every repository in use, ensure that access is allowed only by IP allowlist, and that access is forbidden for all others IPs.

## Remediation

Create an IP allowlist and forbid all other IPs from accessing the source code.
