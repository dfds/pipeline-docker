# DFDS Development Excellence Toolbox images

## How to build

To build the toolbox image, run:

```shell
docker build -t "toolbox:0.1" toolbox/
```

To build an image by hand run the following command

```shell
docker build -t "name:tag"  --build-arg APP_IMAGE="$APP_IMAGE" --build-arg TOOLBOX_IMAGE="$TOOLBOX_IMAGE" folder/type
```

For example:

```shell
docker build -t "build:alpine-full-0.1.1"  --build-arg APP_IMAGE="alpine:3.11" --build-arg TOOLBOX_IMAGE="toolbox:0.1" alpine/full
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