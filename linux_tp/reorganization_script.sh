#!/usr/bin/env bash

mkdir -p Root

reps=(devops data fonctionnel)

for rep in "${reps[@]}"; do
 [ -d "$rep" ] || continue

 for filepath in "$rep"/*.txt; do
  [ -f "$filepath" ] || continue

  filename="$(basename "$filepath")"

  prefix="${filename%%_*}"
  partie_date="${filename#*_}"
  partie_date="${partie_date%.txt}"

  IFS="-" read -r an mois jour heure minute seconde milis <<< "$partie_date"

  n_rep="Root/$rep/$prefix/$an/$mois/$jour/$heure"
  mkdir -p "$n_rep"

  n_nom="${minute}${seconde}${milis}.dat"
  n_path="$n_rep/$n_nom"

  mv "$filepath" "$n_path"

  {
   echo "$filename"
   echo "$filepath"
   echo "creation_script.sh"
  } >> "$n_path"

  chmod 400 "$n_path"
 done
done

