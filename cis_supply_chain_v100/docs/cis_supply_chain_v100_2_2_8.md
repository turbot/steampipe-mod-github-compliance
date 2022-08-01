## Description

Monitor the resource consumption of build workers and set alerts for high consumption that can lead to resource exhaustion.

## Rationale

Resource exhaustion is when machine resources or services are highly consumed until exhausted. Resource exhaustion may lead to DOS (Denial of Service). When such a situation happens to build workers, it slows down and even stops the build process, which harms the production of artifacts and the organization’s ability to deliver software on schedule. To prevent that, it is recommended to monitor resource consumption in the build workers and set alerts to notify when they are highly consumed. That way, resource exhaustion can be acknowledged and prevented at an early stage.

## Audit

Verify that there is monitoring of resource consumption for each build worker.

## Remediation

Set resource consumption monitoring for each build worker.
