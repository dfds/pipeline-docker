ARG APP_IMAGE=debian:buster-slim
ARG TOOLBOX_IMAGE=toolbox:v1
FROM $TOOLBOX_IMAGE AS toolbox
FROM $APP_IMAGE

RUN apt-get update && apt-get install -y --no-install-recommends \ 
    curl \
    wget \
    unzip \
    jq \
    ssh \
    groff \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Get binaries from toolbox
COPY --from=toolbox /toolbox/aws/ \
                    /toolbox/terraform/ \
                    /toolbox/terragrunt/ \
                    /usr/local/bin/

# Get AWS-CLI tool from toolbox
COPY --from=toolbox /usr/local/aws-cli/ /usr/local/aws-cli/

# Change pager so command output is not comming from 'less'
ENV AWS_PAGER=""

# Start in bash as default
CMD [ "bash" ]