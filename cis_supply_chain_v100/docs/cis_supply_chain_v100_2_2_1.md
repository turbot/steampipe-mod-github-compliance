## Description

Use a clean instance of build worker for every pipeline run.

## Rationale

Using a clean instance of build worker for every pipeline run eliminates the risks of data theft, data integrity breaches, and unavailability. It limits the pipeline’s access to data stored on the file system from previous runs, and the cache is volatile. This prevents malicious changes from affecting other pipelines or the Continuous Integration/Continuous Delivery (CI/CD) system itself.

*Note* Data and cache will not be saved in different pipeline runs.

## Audit

Ensure that every pipeline that is being run has its own clean, new runner.

## Remediation

Create a clean build worker for every pipeline that is being run, or use build platform-hosted runners, as they typically offer a clean instance for every run.
