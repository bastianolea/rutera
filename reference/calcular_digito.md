# Calcular dígito verificador del RUT

Calcula el dígito verificador para un RUT sin dígito verificador. Puede
recibir uno o varios RUTs.

## Usage

``` r
calcular_digito(rut_sin_digito)
```

## Arguments

- rut_sin_digito:

  Vector de RUTs sin dígito verificador

## Value

Dígito verificador del cuerpo del RUT entregrado, en tipo caracter

## Examples

``` r
calcular_digito(24324110)
#> [1] "3"

calcular_digito(
  c(11111111, 1111111, 8519622)
)
#> [1] "1" "4" "7"
```
