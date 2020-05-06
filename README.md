# DFDS Development Excellence Toolbox images

## Currently maintained tags

| Tag         | Base                                                | Description                      |
| ----------- | --------------------------------------------------- | -------------------------------- |
| `slim`      | debian:buster-slim                                  | Replaces `pre-prime` and `prime` |
| `pwsh-slim` | mcr.microsoft.com/powershell:lts-debian-buster-slim |                                  |
| `full`      | debian:buster-slim                                  |                                  |
| `pwsh-full` | mcr.microsoft.com/powershell:lts-debian-buster-slim |                                  |
| `eks`       | debian:buster-slim                                  |                                  |

## Tools included

Overview of what tools (not which version) to expect for each base tag name:

| Tool                     | `slim` | `pwsh-slim` | `full` | `eks` |
| ------------------------ | :----: | :---------: | :----: | :---: |
| AWS CLI                  |   X    |             |   X    |   X   |
| AWS Tools for PowerShell |        |      X      |        |       |
| `terraform`              |   X    |      X      |   X    |   X   |
| `terragrunt`             |   X    |      X      |   X    |   X   |
| `kubectl`                |        |             |   X    |   X   |
| `saml2aws`               |        |             |   X    |       |
| `aws-iam-authenticator`  |        |             |   X    |   X   |
| `helm`                   |        |             |   X    |   X   |
| Azure CLI                |        |             |        |   X   |
| `kafkacat`               |        |             |        |   X   |
| `python`                 |        |             |        |   X   |



toolbox-debian:terraform-awscli-0.1
toolbox-debian:minimal-awscli-0.1.1
toolbox-debian:full-awstools-0.1.1
toolbox-debian:eks-0.1.1

toolbox-powershell:
toolbox-python:
toolbox-go:


|   X   |   Y   |   Z   |
| :---: | :---: | :---: |
|       |       |       |



| Tool                     | `$base-terraform` | `$base-slim-awscli` | `pwsh-slim-awstools` | `$base-full-awscli` | `$base-full-awstools` |      `eks`      | `aws-account` |
| ------------------------ | :---------------: | :-----------------: | :------------------: | :-----------------: | :-------------------: | :-------------: | :-----------: |
| Base                     |   deb/pwsh/pyt    |   $base-terraform   |    pwsh-terraform    |  $base-slim-awscli  |  pwsh-slim-awstools   | deb-full-awscli |      TBD      |
| AWS CLI                  |                   |          X          |                      |                     |                       |                 |               |
| AWS Tools for PowerShell |                   |                     |          X           |                     |                       |                 |               |
| `terraform`              |         X         |                     |                      |                     |                       |                 |               |
| `terragrunt`             |         X         |                     |                      |                     |                       |                 |               |
| `kubectl`                |                   |                     |                      |          X          |           X           |                 |               |
| `saml2aws`               |                   |                     |                      |          X          |           X           |                 |               |
| `aws-iam-authenticator`  |                   |                     |                      |          X          |           X           |                 |               |
| `helm`                   |                   |                     |                      |          X          |           X           |                 |               |
| Azure CLI                |                   |                     |                      |                     |                       |        X        |               |
| `kafkacat`               |                   |                     |                      |                     |                       |        X        |               |
| `python`                 |                   |                     |                      |                     |                       |        X        |               |
