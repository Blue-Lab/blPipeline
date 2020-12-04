test_data <- c(0.25, 0.5, 0.75)
test_that("calculate_lambda returns error with negative values", {
  expect_error(
    calculate_lambda(c(test_data, -1)),
    "No negative values allowed in stat \\(does beta/se need to be squared\\?\\)"
  )
})

test_that("calculate_lambda works as expected", {
  eg_calc <- median(test_data, na.rm = TRUE) / qchisq(0.5, df = 1)
  expect_equal(calculate_lambda(test_data, 1), eg_calc)
  expect_equal(calculate_lambda(c(NA, test_data), 1), eg_calc)
})
