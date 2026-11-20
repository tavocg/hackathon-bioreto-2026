#!/usr/bin/env bash

if [[ $# != 1 ]]; then
  echo "Uso: $0 {medir_ph|medir_poblacion|medir_mhet|temperatura|buffer|plastico|filtrar|revivir}" >&2
  exit 2
fi

case $1 in
  plastico)    datos='{"tipo":"plastico","x":300,"y":250}' ;;
  temperatura) datos='{"tipo":"temperatura","delta":1}' ;;
  medir_ph|medir_poblacion|medir_mhet|filtrar|revivir)
    printf -v datos '{"tipo":"%s"}' "$1" ;;
  buffer)      datos='{"tipo":"buffer","delta":-1}' ;;
  *) echo "Acción desconocida: $1" >&2; exit 2 ;;
esac

: "${BIO:?Define BIO con la URL base de la API}"
: "${TOKEN:?Define TOKEN con el token del equipo}"

curl --silent --show-error --fail-with-body \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  --data "$datos" "${BIO%/}/api/equipo/accion"
