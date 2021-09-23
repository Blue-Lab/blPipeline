#' Read plink.sexcheck
#'
#' Read in the output of `plink --check-sex` as a dataframe.
#'
#' @param plink.sexcheck Output from `plink --check-sex`.
#' @param ... Arguments passed throught to read.table().
#'
#' @export

read_sexcheck <- function(plink.sexcheck, ...) {
  return(plink.sexcheck)
}
