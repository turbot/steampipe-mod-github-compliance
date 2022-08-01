## Description

Add traces to build workers' operating systems and installed applications so that in run time, collected events can be analyzed to detect suspicious behavior patterns and malware.

## Rationale

Build workers are exposed to data exfiltration attacks, code injection attacks, and more while running. It is important to secure them from such attacks by enforcing run-time security on the build worker itself. This will identify attempted attacks in real time and prevent them.

## Audit

Verify that a run-time security solution is enforced on every active build worker.

## Remediation

Deploy and enforce a run-time security solution on build workers.
