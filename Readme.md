# DFDS Development Excellence Toolbox images

## Currently maintained tags

| Tag               | Base                                            | Description                      |
| ----------------- | ----------------------------------------------- | -------------------------------- |
| `debian-slim`     | debian:buster-slim                              | Replaces `pre-prime` and `prime` |
| `powershell-slim` | mcr.microsoft.com/powershell:debian-buster-slim |                                  |
| `python-slim`     | python:slim-buster                              |                                  |
| `debian-full`     | debian:buster-slim                              |                                  |
| `powershell-full` | mcr.microsoft.com/powershell:debian-buster-slim |                                  |
| `python-full`     | python:slim-buster                              |                                  |
| `eks`             | debian:buster-slim                              |                                  |


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