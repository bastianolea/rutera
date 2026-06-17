# Validar formato de un RUT

Aplica varias pruebas para confirmar que un RUT es correcto.

## Usage

``` r
validar_rut(rut)
```

## Arguments

- rut:

  Vector de RUTs a consultar

## Value

TRUE/FALSE

## Details

Para confirmar que un RUT es válido, detecta que contenga un guión,
verifica el formato "xxx-x", y valida que el dígito verificador sea
correcto. Esta función acepta uno o varios RUTs.
