




# 5 Deployment

| | TOTAL | 11 |
|-|-|-|
| ✅ | OK | 0 |
| ⇨ | Skip | 0 |
| ℹ | Info | 11 |
| ❌ | Alarm | 0 |
| ❗ | Error | 0 |

# 5.1 Verification

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 7 | 0 | 0 | 7 |


## 5.1.1 Ensure deployment configuration files are separated from source code
 
*Deployment configurations are often stored in a version control system. Separate deployment configuration files from source code repositories.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

## 5.1.2 Ensure changes in deployment configuration are tracked
 
*Audit and track changes made in deployment configuration.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

## 5.1.3 Ensure scanners are in place to identify and prevent sensitive data in deployment configuration
 
*Detect and prevent sensitive data—such as confidential ID numbers, passwords, etc, in deployment configurations.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

## 5.1.4 Ensure access to deployment configurations are limited to specific members
 
*Restrict access to the deployment configuration to trusted and qualified users only.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

## 5.1.5 Ensure scanners are in place to secure Infrastructure as Code (IaC) instructions
 
*Detect and prevent misconfigurations or insecure instructions in Infrastructure as Code (IaC) files, such as Terraform files.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

## 5.1.6 Ensure deployment configuration manifests are verified
 
*Verify the deployment configuration manifests.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

## 5.1.7 Ensure deployment configuration manifests are pinned to a specific, verified version
 
*Deployment configuration is often stored in a version control system and is pulled from there. Pin the configuration used to a specific, verified version or commit Secure Hash Algorithm (SHA). Avoid referring configuration without its version tag specified.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

# 5.2 Deployment Environment

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 4 | 0 | 0 | 4 |


## 5.2.1 Ensure deployments are automated
 
*Automate deployments of production environment and application.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

## 5.2.2 Ensure the deployment environment is reproducible
 
*Verify that the deployment environment—the orchestrator and the production environment where the application is deployed—is reproducible. This means that the environment stays the same in each deployment if the configuration has not changed.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

## 5.2.3 Ensure access to production environment is limited
 
*Restrict access to the production environment to a few trusted and qualified users only.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |

## 5.2.4 Ensure default passwords are not used
 
*Do not use default passwords of deployment tools and components.*

| OK | Skip | Info | Alarm | Error | Total |
|-|-|-|-|-|-|
| 0 | 0 | 1 | 0 | 0 | 1 |



| | Reason | Dimensions |
|-|--------|------------|
| ℹ | Manual verification required.|  |


\
_Report run at `2022-08-04 20:17:49` using [`Steampipe 0.16.0-rc.5`](https://steampipe.io) in dir `/Users/raj/raj-official/mods/steampipe-mod-github-compliance`._
