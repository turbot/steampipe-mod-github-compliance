## Description

Scan every package automatically for ownership change.

## Rationale

A change in package ownership is not a regular action. In some cases it can lead to a massive problem (for example, the "event-stream" incident). Open-source contributors are not always trusted, since by its very nature everyone can contribute. This means malicious actors can become contributors as well. Package maintainers might transfer their ownership to someone they do not know if maintaining the package is too much for them, in some cases without the other user's knowledge. This has led to known security breaches in the past. It is best to be aware of such activity as soon as it happens and to carefully examine the situation before continuing using the package in order to determine its safety.

## Audit

Ensure automatic scanning of packages for ownership change is set.

## Remediation

Set automatic scanning of packages for ownership change.
