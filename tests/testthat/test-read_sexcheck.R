test_that("read_sexcheck successfully reads in valid plink.sexcheck file", {
  testfile <- "plink.sexcheck"
  expected <- read.table(testfile, header = TRUE, sep = "")
  test <- read_sexcheck(testfile)
  expect_identical(expected, test)
})

test_that("read_sexcheck throws warning when file is read successfully but colnames do not match", {
  warnfile <- "missing_col.sexcheck"
  exp_warn <- "read_sexcheck\\(\\) was able to succesfully read missing_col\\.sexcheck, but the colnames were:\nFID, PEDSEX, SNPSEX, STATUS, F;\ninstead of:\nFID, IID, PEDSEX, SNPSEX, STATUS, F"
  expect_warning(read_sexcheck(warnfile), exp_warn)
})
