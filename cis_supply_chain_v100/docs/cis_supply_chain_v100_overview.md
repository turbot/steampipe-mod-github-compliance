To obtain the latest version of the official guide, please visit http://benchmarks.cisecurity.org.

  **Note**: Some sections from the CIS Supply Chain Security compliance benchmark are not provided due to manual evaluation in the current state. The sections will be updated as any recommendation is provided by the user community or will be added as definite steps are updated in CIS's upcoming updates.

## Overview

The overall vision of the CIS Supply Chain Security Guide and ultimately of the CIS Benchmarks is to support key emerging standards like Supply-chain Levels for Software Artifacts (SLSA) and The Update Framework (TUF) with foundational recommendations for setting and auditing configurations on the Benchmark-supported platforms.

The CIS Software Supply Chain Security Guide currently consists of 100+ recommendations organized into five main categories:

1. **Source Code**: Security recommendations for proper source code management of any application developed by the organization.

    This is the first phase of the software supply chain and is considered the only source of truth for the rest of the process. Because of that, it needs to be protected from the code itself, with the vulnerabilities, misconfigurations, and sensitive data it might hold, to the platform it is stored on.

2. **Build Pipelines**: Security recommendations for the management and security of the build pipeline components.

    Build components include build pipelines—a set of instructions dedicated to taking raw files of source code and running a series of tasks on them to achieve some final artifact as output, the environment they are running on, their management and execution, and more. This second phase of the software supply chain is targeted increasingly at supply chain attacks (e.g., the Codecov attack or SolarWinds).

3. **Dependencies**: Security recommendations for the management of various dependencies introduced as part of the software build and release process.

    Dependencies are a huge part of the software supply chain, as they are comprised of anything that goes into application code or is used by the build pipelines themselves. They are often written by third-party developers and might be vulnerable to certain attacks (e.g., the log4j attack).

4. **Artifacts**: Security recommendations for the management of artifacts produced by build pipelines, as well as ones used by the application in the build process itself.

    Artifacts are packaged versions of software. They are stored in package registries (or artifact managers) and require securing from the moment they are created, through the time they are copied and updated, and up to deployment to their relevant environment.

5. **Deployment**: Security recommendations for the management of the application deployment process, the configurations, and the files that come with it.

    Artifacts are packaged versions of software. They are stored in package registries (or artifact managers) and require securing from the moment they are created, through the time they are copied and updated, and up to deployment to their relevant environment.
