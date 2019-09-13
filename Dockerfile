# ========================================
# GENERAL PREREQUISITES
# ========================================

FROM debian:buster-slim

# Explicitly set USER env variable to accomodate issues with golang code being cross-compiled
ENV USER root

RUN apt-get update \
    && apt-get install -y curl unzip git bash-completion jq ssh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Adding  GitHub public SSH key to known hosts
RUN ssh -T -o "StrictHostKeyChecking no" -o "PubkeyAuthentication no" git@github.com || true


# ========================================
# PYTHON
# ========================================

RUN apt-get update \
    && apt-get install -y python python-pip python3 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# ========================================
# AWS CLI
# ========================================

ENV AWSCLI_VERSION=1.16.238

RUN python3 -m pip install --upgrade pip \
    && pip3 install pipenv awscli==${AWSCLI_VERSION} \
    && echo "complete -C '$(which aws_completer)' aws" >> ~/.bashrc

# ========================================
# TERRAFORM
# ========================================

ENV TERRAFORM_VERSION=0.11.10

RUN curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
    && unzip terraform.zip \
    && rm terraform.zip \
    && mv terraform /usr/local/bin/
    #&& terraform -install-autocomplete


# ========================================
# TERRAGRUNT
# ========================================

ENV TERRAGRUNT_VERSION=0.16.14

RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -o terragrunt \
    && chmod +x terragrunt \
    && mv terragrunt /usr/local/bin/


CMD [ "bash" ]