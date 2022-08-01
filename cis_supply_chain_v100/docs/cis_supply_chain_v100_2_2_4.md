## Description

Ensure that build workers have minimal network connectivity.

## Rationale

Restricting the network connectivity of build workers decreases the possibility that an attacker would be capable of entering the organization from the outside. If the build workers are connected to the public internet without any restriction, it is far simpler for attackers to compromise them. Limiting network connectivity between build workers also protects the organization in case an attacker was successful and subsequently attempts to spread the attack to other components of the environment.

*Note* Developers will not have connectivity to every resource they might need from the outside. Workers will also only be able to exchange data through shareable storage.

## Audit

Verify that build workers, environment, and any other components have only the required minimum of network connectivity.

## Remediation

Limit the network connectivity of build workers, environment, and any other components to the necessary minimum.
