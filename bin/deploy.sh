#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: bin/deploy <cluster env> <component>"
  exit 1
fi

cluster=$1
component=$2

containsElement () {
  support_env=(apollo-my-prod apollo-zft-prod)
  env=$1
  for e in $support_env; do
    [[ "$e" = "$env" ]] && return 0;
  done;
  echo "Not support -> $env cluster"
  exit 1;
}

safe_check() {
  containsElement $cluster
}

safe_check
docker-compose run --rm ntpl validate -p params/base.yaml -p params/${cluster}.yaml -c $component
docker-compose run --rm ntpl apply -p params/base.yaml -p params/${cluster}.yaml -c $component
