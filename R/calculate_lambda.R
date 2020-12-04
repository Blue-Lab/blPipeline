calculate_lambda <- function(stat, df) {
    if (any(sum(stat < 0, na.rm=TRUE)))
        stop("No negative values allowed in stat (does beta/se need to be squared?)")
    median(stat, na.rm = TRUE) / qchisq(0.5, df = df)
}
