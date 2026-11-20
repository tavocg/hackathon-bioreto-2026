# BioReto 2026-11-20

```sh
alias api='curl -s -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -X POST'
```

```sh
$BIO/api/equipo/accion

'{"tipo":"plastico","x":300,"y":250}'
'{"tipo":"temperatura","delta":1}'
'{"tipo":"filtrar"}'
'{"tipo":"buffer","delta":-1}'
```

Modificamos primero el valor del pH hacia arriba y temperatura hacia abajo, pero, notamos que estaban muriendo demasiado.

Porsteriormente, ajustamos nuestra estrategia para subir la temperatura y ajustar el pH a valores recomendados por repositorios bacteriológicos.


Para sobrevivir el lote infectado, tuvimos que agregar plástico y filtrar el mhet creado.

Posterior a eso simplemente es cuestión de agregar el plástico para que no se queden sin comida.

La solución era 37 grados de temperatura y 6.8 de pH.

## Acciones de la API y costo por petición

| Tipo de acción | Para qué | Costo (◆) |
| --- | --- | ---: |
| `medir_ph` | Qué tan ácido o básico está el medio. | 2 |
| `medir_poblacion` | Cuántas bacterias hay en total. | 2 |
| `medir_mhet` | El MHET, una sustancia que aparece al digerir el plástico. | 5 |
| `temperatura` | Subir o bajar 1 °C la incubadora (delta 1 o -1). | 3 |
| `buffer` | Mover el pH medio punto (delta 1 o -1). | 3 |
| `plastico` | Servir plástico en el punto x, y. | 4 |
| `filtrar` | Limpiar el medio de toda la placa. | 8 |
| `revivir` | Empezar de nuevo una colonia que se extinguió. | 40 |

El nombre de la acción va en el campo `tipo` del JSON. Por ejemplo, para medir el pH con el alias anterior:

```sh
api "$BIO/api/equipo/accion" -d '{"tipo":"medir_ph"}'
```
