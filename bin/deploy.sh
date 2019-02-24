#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: bin/deploy <cluster env> <component>"
  exit 1
fi

dcr="docker-compose run --rm"
cluster=$1
component=$2

# safe_check() {
#   support_env=(apollo-my-prod apollo-zft-prod)
#
# }

$(${dcr} ntpl validate -p params/base.yaml -p params/${cluster}.yaml -c $component)
# $dcr ntpl apply -p params/base.yaml -p params/${cluster}.yaml -c $component
