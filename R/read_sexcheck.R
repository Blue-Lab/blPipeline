#' Read plink.sexcheck
#'
#' Read in the output of `plink --check-sex` as a dataframe.
#'
#' @param plink.sexcheck Output from `plink --check-sex`.
#' @param ... Arguments passed throught to read.table().
#'
#' @export

read_sexcheck <- function(plink.sexcheck, ...) {
  x <- utils::read.table(plink.sexcheck, header = TRUE, sep = "", ...)
  if (!identical(names(x), SEXCHECK_COLNAMES)) {
    warn <- sprintf(READ_SEXCHECK_COLNAME_WARN, plink.sexcheck,
                    paste(names(x), collapse = ", "),
                    paste(SEXCHECK_COLNAMES, collapse = ", "))
    warning(warn)
  }
  return(x)
}
