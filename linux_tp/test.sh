#!/usr/bin/env bash

nom="$1"

if [ -z "$nom" ]; then
  echo "usage : $0 <prenom>"
  exit 1
fi

echo "Salut $nom, bien arrivé sur ta machine kuikops"
