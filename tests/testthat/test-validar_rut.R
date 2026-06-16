test_that("validación de rut simple", {
  expect_true(
    validar_rut("17505116-3")
  )
})


test_that("validación de varios rut", {
  expect_equal(
    validar_rut(
      c("hola", "11111111", "19413730-3")
    ),
    c(FALSE, FALSE, TRUE)
  )
})
