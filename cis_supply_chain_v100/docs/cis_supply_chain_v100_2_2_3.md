## Description

Separate responsibilities in the build workflow, such as testing, compiling, pushing artifacts, etc., to different build workers so that each worker will have a single duty.

## Rationale

Separating duties and allocating them to many workers makes it easier to verify each step in the build process and ensure there is no corruption. It also limits the effect of an attack on a build worker, as such an attack would be less critical if the worker has less access and fewer duties that are subject to harm.

## Audit

For each build worker, ensure it has the least responsibility possible, preferably only one duty.

## Remediation

For each build worker, limit its responsibility to one duty.
