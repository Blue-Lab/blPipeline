#' Calculate lambda
#'
#' Calculate the genomic inflation factor from a vector of p-values
#'
#' @param stat A vector of p-values
#' @param df Degrees of freedom
#'
#' @export

calculate_lambda <- function(stat, df) {
    if (any(sum(stat < 0, na.rm=TRUE)))
        stop("No negative values allowed in stat (does beta/se need to be squared?)")
    stats::median(stat, na.rm = TRUE) / stats::qchisq(0.5, df = df)
}
