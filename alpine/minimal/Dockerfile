ARG APP_IMAGE=alpine:3.11
ARG TOOLBOX_IMAGE=toolbox:v1
FROM $TOOLBOX_IMAGE AS toolbox
FROM $APP_IMAGE

RUN apk --update --no-cache add \ 
    curl \
    wget \
    unzip \
    bash \
    jq \
    groff \
    openssh-client \
    && rm -rf /var/cache/apk/*

# Get binaries from toolbox
COPY --from=toolbox /toolbox/aws/ \
                    /toolbox/terraform/ \
                    /toolbox/terragrunt/ \
                    /usr/local/bin/

# Actual path to AWS CLI tools
COPY --from=toolbox /usr/local/aws-cli/ /usr/local/aws-cli/

# Change pager so command output is not comming from 'less'
ENV AWS_PAGER=""

# Start in bash as default
CMD [ "bash" ]