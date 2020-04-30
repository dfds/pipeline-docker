# --------------------------------------------------
# Base
# --------------------------------------------------

FROM debian:buster-slim


# --------------------------------------------------
# terraform (System.Collections.Hashtable)
# --------------------------------------------------

ENV TERRAFORM_VERSION=$$Version$$

RUN curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
    && unzip terraform.zip \
    && rm terraform.zip \
    && mv terraform /usr/local/bin/
    #&& terraform -install-autocomplete


# --------------------------------------------------
# aws-cli (System.Collections.Hashtable)
# --------------------------------------------------

ENV Something
RUN Else $SomeVariable
