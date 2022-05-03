test_that("extract_dosage_est returns error when inputs are different length", {
  expect_error(extract_dosage_est(NULL, 1, 1:5, 1:5),
               "chrom, from.bp and to.bp are not all equal length") 
})
