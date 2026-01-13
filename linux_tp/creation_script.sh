#!/usr/bin/env bash

if [ $# -ne 2 ]; then
  echo "il manque : des arguments pour $0"
  exit 1
fi

repertoire="$1"
prefixe="$2"
nb_fichiers="3"
interval="200"

mkdir -p "$repertoire"
cd "$repertoire" || exit 1

for ((i=1; i<=nb_fichiers; i++)); do
  time="$(date +%Y-%m-%d-%H-%M-%S-%3N)"
  fichier="${prefixe}_${time}.txt"
  touch "$fichier"

  if [ "$i" -lt "$nb_fichiers" ]; then
   sleep "$(bc -l <<< "$interval/1000")"
  fi
 done

