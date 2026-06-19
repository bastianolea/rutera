# Limpiar RUTs

Recibe un vector de posibles RUT, y los limpia eliminando puntuación y
espacios, extrayendo números, y separando el dígito verificador

## Usage

``` r
limpiar_rut(ruts)
```

## Arguments

- ruts:

  Vector de texto con RUTs

## Value

Vector de texto con RUTs limpios en formato `xxxxxxx-y`

## Examples

``` r
rut_sucios <- c(
  "24.444.145-9",
  "24444145 9",
  "24 444 145 9",
  "24,444,145,9",
  "2M4A4P4A4C1H4E59",
  "244441459",
  "hola hola")

limpiar_rut(rut_sucios)
#> ! algunos RUT no tienen últimos dígitos
#> ! algunos RUT vacíos luego de la limpieza
#> [1] "24444145-9" "24444145-9" "24444145-9" "24444145-9" "24444145-9"
#> [6] "24444145-9" NA          
```
