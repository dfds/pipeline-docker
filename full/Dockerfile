# ========================================
# CREATE UPDATED BASE IMAGE
# ========================================

ARG APP_IMAGE=debian:buster-slim
FROM $APP_IMAGE


# ========================================
# HELM
# ========================================

ARG HELM_VERSION=3.2.0

RUN curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o helm.tgz \
    && tar -zxvf helm.tgz \
    && rm helm.tgz \
    && mv linux-amd64/helm /usr/local/bin/ \
    && rm -R linux-amd64 \
    && echo "source <(helm completion bash)" >> ~/.bashrc

# ========================================
# AWS IAM AUTHENTICATOR
# ========================================

ARG AWSIAMAUTH_VERSION=1.15.10/2020-02-22

RUN curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/${AWSIAMAUTH_VERSION}/bin/linux/amd64/aws-iam-authenticator -o aws-iam-authenticator \
    && chmod +x aws-iam-authenticator \
    && mv aws-iam-authenticator /usr/local/bin/


# ========================================
# SAML2AWS
# ========================================

ARG SAML2AWS_VERSION=2.26.0

RUN wget https://github.com/Versent/saml2aws/releases/download/v${SAML2AWS_VERSION}/saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz \
    && tar -xzvf saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz -C /usr/local/bin/ \
    && rm saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz \
    && chmod u+x /usr/local/bin/saml2aws


# ========================================
# KAFKA MESSAGE PRODUCER
# ========================================

RUN apt-get update \
    && apt-get install -y kafkacat \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ========================================
# Default container start command
# ========================================

CMD [ "bash" ]