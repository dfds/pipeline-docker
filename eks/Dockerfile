# ========================================
# CREATE UPDATED BASE IMAGE
# ========================================

ARG APP_IMAGE=devex:debian-full
FROM $APP_IMAGE

# ========================================
# AZURE CLI
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
# ========================================

ENV AZURECLI_VERSION=2.5.0-1~stretch

RUN apt-get update \
    && apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg

RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null


RUN AZ_REPO=$(lsb_release -cs) \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list

RUN apt-get update \
    && apt-get install azure-cli=${AZURECLI_VERSION} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ========================================
# Default container start command
# ========================================

CMD [ "bash"
