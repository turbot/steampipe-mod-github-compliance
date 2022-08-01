## Description

Monitor, or ask software suppliers to monitor, dependencies between open-source components in use.

## Rationale

Monitoring dependencies between open-source components helps to detect if software has fallen victim to attack on a common open-source component. Swift detection can aid in quick application of a fix. It also helps find potential compliance problems with components usage. Some dependencies might not be compatible with the organization’s policies, and other dependencies might have a license that is not compatible with how the organization uses this specific dependency. If dependencies are monitored, such situations can be detected and mitigated sooner, potentially deterring malicious attacks.

## Audit

For each open-source component, ensure its dependencies are monitored.

## Remediation

For each open-source component, monitor its dependencies.
