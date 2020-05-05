# ========================================
# CREATE UPDATED BASE IMAGE
# ========================================

ARG APP_IMAGE=devex:debian-full
FROM $APP_IMAGE

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# ========================================
# GENERAL PREREQUISITES
# ========================================

RUN apt-get update \
    && apt-get install -y curl wget unzip git bash-completion jq ssh groff \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Adding  GitHub public SSH key to known hosts
RUN ssh -T -o "StrictHostKeyChecking no" -o "PubkeyAuthentication no" git@github.com || true


# ========================================
# AWS CLI
# ========================================

# Always install newest version
# Doesn't seem to allow version lock https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf ./aws \
    && rm awscliv2.zip

# Change pager so command output is not comming from 'less'
ENV AWS_PAGER=""

# ========================================
# TERRAFORM
# ========================================

ARG TERRAFORM_VERSION=0.12.24

RUN curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
    && unzip terraform.zip \
    && rm terraform.zip \
    && mv terraform /usr/local/bin/ \
    && terraform -install-autocomplete


# ========================================
# TERRAGRUNT
# ========================================

ARG TERRAGRUNT_VERSION=0.23.12

RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -o terragrunt \
    && chmod +x terragrunt \
    && mv terragrunt /usr/local/bin/


# ========================================
# KUBECTL
# ========================================

ARG KUBECTL_VERSION=1.18.2

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/


# ========================================
# Default container start command
# ========================================

CMD [ "bash" ]