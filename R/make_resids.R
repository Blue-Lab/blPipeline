#' Run survival analysis and compute residuals on a phenotype dataframe
#'
#' @param x A dataframe with age, status and covariate variables
#' @param age The name of the age variable
#' @param status The name of the event variable
#' @param surv_name The name of the survival variable in the returned dataframe
#' @param covars The names of the covariates for the Cox regression
#' @param keep_reg Indicator for the function to return the Cox regression object
#' @param mgl_name The name of the Martingale residual variable in the returned dataframe
#' @param dev_name The name of the deviance residual variable in the returned dataframe
#' @param weighted Passed as the argument `weighted` to `residuals()`
#'
#' @import survival
#' @export

make_resids <- function(x, age, status, surv_name = "surv", covars,
                        keep_reg = FALSE, mgl_name = "martingale",
                        dev_name = "devres", weighted = FALSE){
  x[[surv_name]] <- survival::Surv(time = x[[age]], event = x[[status]])
  fmla <- stats::as.formula(paste0(surv_name, " ~ ", paste(covars, collapse = " + ")))
  coxreg <- survival::coxph(fmla, x)
  idx <- stats::complete.cases(dplyr::select(x, c(age, status, covars)))
  x[[mgl_name]] <- NA_real_
  x[[dev_name]] <- NA_real_
  x[idx, mgl_name] <- stats::residuals(coxreg, type = "martingale",
                                weighted = weighted)
  x[idx, dev_name] <- stats::residuals(coxreg, type = "deviance", weighted = weighted)

  if (keep_reg) {
    return(list(dat = x, coxreg = coxreg))
  } else {
    return(x)
  }
}
