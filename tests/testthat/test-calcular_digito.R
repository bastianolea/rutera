test_that("cálculo de dígito verificador simple", {
  expect_equal(
    calcular_digito(11111111),
    "1"
  )
})

test_that("cálculo de dígito verificador con K", {
  expect_equal(
    calcular_digito(12372304),
    "K"
  )
})


test_that("cálculo de varios dígitos verificadores", {
  expect_equal(
    calcular_digito(
      c(11111111, 1111111, 8519622)
    ),
    c("1", "4", "7")
  )
})
