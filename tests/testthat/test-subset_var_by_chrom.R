test_that("subset_var_by_chrom", {
  g <- gdsfmt::createfn.gds("tmp.gds")
  gdsfmt::add.gdsn(g, "sample.id", 1:10)
  gdsfmt::add.gdsn(g, "variant.id", 1:15)
  gdsfmt::add.gdsn(g, "chromosome", c(rep(1, 5), rep(2, 5), rep(3, 5)))
  class(g) <- "SeqVarGDSClass"
  expect_equal(subset_var_by_chrom(1:15, 1, g), 1:5)
  expect_equal(subset_var_by_chrom(1:15, 1:2, g), 1:10)
  expect_equal(subset_var_by_chrom(1:15, c(1, 3), g), c(1:5, 11:15))
  expect_warning(subset_var_by_chrom(1:20, 1, g), IDS_NOT_PRESENT_SBC_WARN)
  unlink(g)
})

