#' Validar formato de un RUT
#'
#' Aplica varias pruebas para confirmar que un RUT es correcto.
#'
#' Para confirmar que un RUT es válido, detecta que contenga un guión, verifica el formato "xxx-x", y valida que el dígito verificador sea correcto. Esta función acepta uno o varios RUTs.
#' @export
#'
#' @returns TRUE/FALSE
#'
#' @param rut Vector de RUTs a consultar
#'
validar_rut <- function(rut) {

  # por cada RUT:
  validacion <- purrr::map(
    rut,
    \(rut) {

      # rut <- "18172852-3"
      rut <- as.character(rut)
      rut <- toupper(rut)

      # confirmar guión
      confirmar_guion <- stringr::str_detect(rut, "-")
      if (!confirmar_guion) {
        cli::cli_alert_warning("RUT {rut} no incluye guión")
        return(FALSE)
      }

      # verificar formato esperado
      confirmar_formato <- stringr::str_detect(rut, "^[0-9]+-[0-9K]$")
      if (!confirmar_formato) {
        cli::cli_alert_warning("RUT {rut} con formato incorrecto")
        return(FALSE)
      }

      # validar dígito verificador
      digito_verificador <- stringr::str_extract(rut, "[0-9K]$")
      rut_sin_digito <- stringr::str_remove_all(rut, "\\-[0-9K]$")

      confirmar_digito <- calcular_digito(rut_sin_digito) == digito_verificador
      if (!confirmar_digito) {
        cli::cli_alert_warning("RUT {rut} con dígito verificador incorrecto")
        return(FALSE)
      }

      return(TRUE)
    })

  return(
    unlist(validacion)
  )
}
