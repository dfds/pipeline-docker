#!/bin/bash
# Set verbosity level and import .env file as variables in this script run
set -e -x -o allexport
source .env
set +o allexport

# Downloads all the tools into the toolbox image and puts them in the /toolbox folder

# Download Terraform
curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
    && unzip terraform.zip \
    && rm terraform.zip \
    && mv terraform /toolbox/

# Download Terragrunt
curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -o terragrunt \
    && chmod +x terragrunt \
    && mv terragrunt /toolbox/

# Download Kubectl
curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o kubectl \
    && chmod +x kubectl \
    && mv kubectl /toolbox/

# Download saml2aws
curl -L https://github.com/Versent/saml2aws/releases/download/v${SAML2AWS_VERSION}/saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz -o saml2aws.tar.gz \
    && tar -xzvf saml2aws.tar.gz \
    && rm saml2aws.tar.gz \
    && chmod +x saml2aws \
    && mv saml2aws /toolbox/

# Download aws-iam-authenticator
curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/${AWSIAMAUTH_VERSION}/bin/linux/amd64/aws-iam-authenticator -o aws-iam-authenticator \
    && chmod +x aws-iam-authenticator \
    && mv aws-iam-authenticator /toolbox/

# Download Helm
curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o helm.tgz \
    && tar -zxvf helm.tgz \
    && rm helm.tgz \
    && mv linux-amd64/helm /toolbox/ \
    && rm -R linux-amd64