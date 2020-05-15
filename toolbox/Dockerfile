FROM alpine:latest

RUN apk --update --no-cache add \ 
    curl \
    wget \
    unzip \
    bash \
    && rm -rf /var/cache/apk/*

WORKDIR /tmp/
COPY ./scripts/ /tmp/
RUN mkdir /toolbox

# Get AWS CLI
COPY --from=amazon/aws-cli /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=amazon/aws-cli /usr/local/bin/ /toolbox/

# Get Binaries defined in script
RUN chmod +x /tmp/install.sh && /tmp/install.sh && rm /tmp/install.sh
