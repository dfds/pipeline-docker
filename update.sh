#!/bin/bash
set -eo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

upstreamVersion="$("Command to get replacement")"

set -x
sed -ri 's/^(ENV NAME_OF_ENV) .*/\1 '"$upstreamVersion"'/' */Dockerfile.builder
