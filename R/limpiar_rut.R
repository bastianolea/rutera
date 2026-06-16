#' Limpiar RUTs
#'
#' Recibe un vector de posibles RUT, y los limpia eliminando puntuación y espacios, extrayendo números, y separando el dígito verificador
#' @export
#'
#' @param ruts Vector de texto con RUTs
#'
#' @returns Vector de texto con RUTs limpios en formato `xxxxxxx-y`
limpiar_rut <- function(ruts) {
  originales <- ruts

  ruts <- as.character(originales)

  ruts <- stringr::str_remove_all(ruts, "[:punct:]")

  ruts <- stringr::str_remove_all(ruts, " ")

  ruts <- stringr::str_extract_all(ruts, "\\d+")

  # procesar lista para casos donde no hay números
  lista_ruts <- purrr::map(
    ruts,
    \(rut) {
      # rut <- ruts[6]
      rut <- unlist(rut)
      rut <- paste(rut, collapse = "")
      rut <- ifelse(length(rut) == 0, "", rut)
      return(rut)
    }
  )

  # convertir lista a vector
  ruts_2 <- lista_ruts |> purrr::list_c()

  probar_largos_iguales <- length(ruts_2) == length(ruts)
  if (!probar_largos_iguales) {
    cli::cli_abort(
      "error procesando RUT: largo distintos ({length(ruts)} y {length(lista_ruts)})"
    )
  }

  ultimos_digitos <- ruts_2 |>
    stringr::str_extract("\\d{1}$") |>
    tidyr::replace_na("")

  if (any(nchar(ultimos_digitos) != 1)) {
    cli::cli_alert_warning("algunos RUT no tienen últimos dígitos")
  }

  sin_ultimos_digitos <- ruts_2 |>
    stringr::str_extract(".*(?=.$)") |>
    tidyr::replace_na("")

  # revisar posibles problemas
  if (any(sin_ultimos_digitos == "")) {
    cli::cli_alert_warning("algunos RUT vacíos luego de la limpieza")
  } else if (any(nchar(sin_ultimos_digitos) < 7)) {
    cli::cli_alert_warning("algunos RUT sospechosamente cortos")
  } else if (any(nchar(sin_ultimos_digitos) > 8)) {
    cli::cli_alert_warning(
      "algunos RUT sospechosamente largos (o es alguien del futuro)"
    )
  }

  ruts_limpios <- paste(sin_ultimos_digitos, ultimos_digitos, sep = "-")

  ruts_limpios <- dplyr::na_if(ruts_limpios, "-")

  return(ruts_limpios)
}
