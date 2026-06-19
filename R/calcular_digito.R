#' Calcular dígito verificador del RUT
#'
#' Calcula el dígito verificador para un RUT sin dígito verificador. Puede recibir uno o varios RUTs.
#' @export
#'
#' @returns Dígito verificador del cuerpo del RUT entregrado, en tipo caracter
#'
#' @param rut_sin_digito Vector de RUTs sin dígito verificador
#'
#' @examples
#' calcular_digito(24324110)
#'
#' calcular_digito(
#'   c(11111111, 1111111, 8519622)
#' )
calcular_digito <- function(rut_sin_digito) {
  # separar números en dígitos
  digitos_lista <- strsplit(as.character(rut_sin_digito), "")

  # calcular dígito verificador
  digito <- purrr::map(
    digitos_lista,
    \(digitos) {
      digitos <- as.numeric(digitos)

      # secuencia cíclica de 2 a 7
      pesos <- rep(2:7, length.out = length(digitos))
      # sumar pesos invertidos con los dígitos
      suma <- sum(digitos * rev(pesos))
      # restar número 11 con el módulo 11 de la suma
      digito <- 11 - (suma %% 11)

      return(
        as.character(digito)
      )
    }
  )

  digito <- purrr::list_c(digito)

  # casos especiales
  digito <- ifelse(digito == "11", "0", digito)
  digito <- ifelse(digito == "10", "K", digito)

  return(digito)
}
