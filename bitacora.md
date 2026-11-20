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
