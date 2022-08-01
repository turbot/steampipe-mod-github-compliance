## Description

Scan the pipeline for misconfigurations. It is recommended that this be performed
automatically.

## Rationale

Automatic scans for misconfigurations detect human mistakes and misconfigured tasks. This protects the environment from backdoors caused by such mistakes, which create easier access for attackers. For example, a task that mistakenly configures credentials to persist on the disk makes it easier for an attacker to steal them. This type of incident can be prevented by auto-scanning.

## Audit

For each pipeline, verify that it is automatically scanned for misconfigurations.

## Remediation

For each pipeline, set automated misconfiguration scanning.
