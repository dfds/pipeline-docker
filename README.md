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
