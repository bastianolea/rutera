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

## Examples

``` r
validar_rut("17505116-3")
#> [1] TRUE

validar_rut(c("23376940-1", "24444145-9"))
#> [1] TRUE TRUE

validar_rut(c("hola", "11111111", "19413730-3"))
#> ! RUT HOLA no incluye guión
#> ! RUT 11111111 no incluye guión
#> [1] FALSE FALSE  TRUE
```
