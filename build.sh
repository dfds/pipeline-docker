#!/bin/bash
# Set verbosity level and import .env file as variables in this script run
set -e -x -o allexport
source .env
set +o allexport

cd "$(readlink -f "$(dirname "$BASH_SOURCE")")"

# versions=( "$@" )
# if [ ${#versions[@]} -eq 0 ]; then
# 	versions=( */ )
# fi
# versions=( "${versions[@]%/}" )

declare -a imagebases=("debian:buster-slim" "mcr.microsoft.com/powershell:debian-buster-slim" "python:slim-buster")

basetag='devex:'

# Build slim/full images
for image in "${imagebases[@]}"; do
	(
		set -x
		tag=$(echo "$image" | sed 's/:.*//' | sed 's/.*\///')
		
		# Build slim images
		docker build -t "$basetag$tag-slim" -f "slim/Dockerfile" --build-arg APP_IMAGE="$image" \
					 --build-arg KUBECTL_VERSION=$KUBECTL_VERSION \
					 --build-arg TERRAFORM_VERSION=$TERRAFORM_VERSION \
					 --build-arg TERRAGRUNT_VERSION=$TERRAGRUNT_VERSION \
					 .

		# Build full images
		docker build -t "$basetag$tag-full" -f "full/Dockerfile" --build-arg APP_IMAGE="$basetag$tag-slim" \
					 --build-arg AWSIAMAUTH_VERSION=$AWSIAMAUTH_VERSION \
					 --build-arg SAML2AWS_VERSION=$SAML2AWS_VERSION \
					 --build-arg HELM_VERSION=$HELM_VERSION \
					 .
	)
done