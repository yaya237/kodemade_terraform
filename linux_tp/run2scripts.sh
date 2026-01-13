#!/usr/bin/env bash

declare -A m

m[devops]="git terraform aws"
m[data]="spark scala gcp"
m[fonctionnel]="spec postman sql"

for rep in "${!m[@]}"; do
  for prefixe in ${m[$rep]}; do
    ./creation_script.sh "$rep" "$prefixe"
  done
 done

 ./reorganization_script.sh
