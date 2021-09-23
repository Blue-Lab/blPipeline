test_that("read_sexcheck successfully reads in valid plink.sexcheck file", {
    expect_identical("abc", read_sexcheck("abc"))
})

test_that("read_sexcheck throws warning when file is read successfully but colnames do not match", {
    expect_warning(read_sexcheck("xyz"), "abc")
})
