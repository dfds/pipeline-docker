ARG APP_IMAGE=debian:buster-slim
ARG TOOLBOX_IMAGE=toolbox:v1
FROM $TOOLBOX_IMAGE AS toolbox
FROM $APP_IMAGE

# Get and run install script
COPY ./scripts/ /tmp/
RUN chmod +x /tmp/install.sh && cd /tmp && /tmp/install.sh && rm /tmp/install.sh

# Get binaries from toolbox
COPY --from=toolbox /toolbox/aws-iam-authenticator/ \
                    /toolbox/kubectl/ \
                    /toolbox/aws/ \
                    /toolbox/helm/ \
                    /toolbox/saml2aws/ \
                    /toolbox/terraform/ \
                    /toolbox/terragrunt/ \
                    /usr/local/bin/

# Actual path to AWS CLI tools
COPY --from=toolbox /usr/local/aws-cli/ /usr/local/aws-cli/

# Start in bash as default
CMD [ "bash" ]
