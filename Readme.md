# DFDS Development Excellence Toolbox images

## How to build

```shell
docker build -t "name:tag"  --build-arg APP_IMAGE="$image" --build-arg TOOLBOX_IMAGE="$TOOLBOX_IMAGE" folder/type
```

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