#!/bin/bash
# Set verbosity level and import .env file as variables in this script run
set -e -x -o allexport
source .env
set +o allexport

# Update package list
apt-get update

# Install AZURE CLI
# TIP: Get package version names with: apt-cache madison azure-cli

apt-get install -y --no-install-recommends ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

AZ_REPO=$(lsb_release -cs) \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list

apt-get update && apt-get install --no-install-recommends azure-cli=${AZURECLI_VERSION}

# Install kafka message producer
apt-get install -y --no-install-recommends kafkacat \

# Cleanup apt and dependencies 
apt-get clean
rm -rf /var/lib/apt/lists/*