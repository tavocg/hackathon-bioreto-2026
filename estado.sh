#!/usr/bin/env bash

: "${BIO:?Define BIO con la URL base de la API}"
: "${TOKEN:?Define TOKEN con el token del equipo}"

clear
while true; do
  datos=$(curl -s "$BIO/api/equipo/estado" \
    -H "Authorization: Bearer $TOKEN" |
    jq -C 'del(.equipo, .evento, .prueba, .escala, .ritmo_min_s)')
  printf '\033[H%s\033[J' "$datos"
  sleep 2
done
