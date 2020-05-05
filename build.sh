#!/bin/bash
set -e

cd "$(readlink -f "$(dirname "$BASH_SOURCE")")"

# versions=( "$@" )
# if [ ${#versions[@]} -eq 0 ]; then
# 	versions=( */ )
# fi
# versions=( "${versions[@]%/}" )

declare -a imagebases=("debian:buster-slim" "mcr.microsoft.com/powershell:debian-buster-slim" "python:slim-buster")

basetag='devex:'
for image in "${imagebases[@]}"; do
	(
		set -x
		tag=$(echo "$image" | sed 's/:.*//' | sed 's/.*\///')
		
		docker build -t "$basetag$tag-slim" -f "base/Dockerfile" --build-arg APP_IMAGE="$image" .
		docker build -t "$basetag$tag-full" -f "full/Dockerfile" --build-arg APP_IMAGE="$basetag$tag-slim" .
	)
done
