set.seed(1234)
test_data <- data.frame(event = rbinom(10, 1, 0.5), age = rnorm(10, 55, 10),
                        cov1 = rnorm(10, 0), cov2 = rnorm(10, 10))
res <- test_data
res$surv <- survival::Surv(time = test_data$age,
                                  event = test_data$event)
# Set arg names so call matches in coxreg objects
fmla <- surv ~ cov1 + cov2
x <- res
coxreg <- survival::coxph(fmla, x)
res$martingale <- residuals(coxreg, type = "martingale", weighted = FALSE)
res$devres <- residuals(coxreg, type = "deviance", weighted = FALSE)

test_that("make_resids matches expected output", {
  set.seed(1234)
  test_data <- data.frame(event = rbinom(10, 1, 0.5), age = rnorm(10, 55, 10),
                          cov1 = rnorm(10, 0), cov2 = rnorm(10, 10))
  res <- test_data
  res$surv <- survival::Surv(time = test_data$age,
                                    event = test_data$event)
  # Set arg names so call matches in coxreg objects
  fmla <- surv ~ cov1 + cov2
  x <- res
  coxreg <- survival::coxph(fmla, x)
  res$martingale <- residuals(coxreg, type = "martingale", weighted = FALSE)
  res$devres <- residuals(coxreg, type = "deviance", weighted = FALSE)

  expect_identical(res, make_resids(test_data, "age", "event",
                                    covars = c("cov1", "cov2")))
  expect_equal(list(dat = res, coxreg = coxreg),
               make_resids(test_data, "age", "event", keep_reg = TRUE,
                               covars = c("cov1", "cov2")))
  dat_w_miss <- test_data
  dat_w_miss$age[1] <- NA
  dat_w_miss$cov1[2] <- NA
  dat_w_miss[3, ] <- NA
  res_w_miss <- dat_w_miss
  res_w_miss$surv <- survival::Surv(time = res_w_miss$age,
                                    event = res_w_miss$event)
  coxreg_w_miss <- coxph(surv ~ cov1 + cov2, res_w_miss)
  res_w_miss$martingale <- NA
  res_w_miss$martingale[4:10] <- residuals(coxreg_w_miss, type = "martingale",
                                            weighted = FALSE)
  res_w_miss$devres <- NA
  res_w_miss$devres[4:10] <- residuals(coxreg_w_miss, type = "deviance",
                                       weighted = FALSE)
  expect_identical(res_w_miss, make_resids(dat_w_miss, "age", "event",
                                           covars = c("cov1", "cov2")))
})

test_that("Doesn't fail when argument names match variable names", {
  varname_test <- test_data
  varname_test$age2 <- varname_test$age + rnorm(10, 0)
  varname_test$age2[1] <- NA


  varname_res <- varname_test
  varname_res$surv <- survival::Surv(time = varname_test$age2,
                                    event = varname_test$event)
  fmla <- surv ~ cov1 + cov2
  x <- varname_res
  coxreg <- survival::coxph(fmla, x)
  varname_res$martingale[2:10] <- residuals(coxreg, type = "martingale", weighted = FALSE)
  varname_res$devres[2:10] <- residuals(coxreg, type = "deviance", weighted = FALSE)

  expect_identical(varname_res, make_resids(varname_test, "age2", "event",
                                    covars = c("cov1", "cov2")))
  expect_equal(list(dat = varname_res, coxreg = coxreg),
               make_resids(varname_test, "age2", "event", keep_reg = TRUE,
                               covars = c("cov1", "cov2")))

  varname_test$age[2] <- NA
  varname_res <- varname_test
  varname_res$surv <- survival::Surv(time = varname_test$age2,
                                    event = varname_test$event)
  fmla <- surv ~ cov1 + cov2
  x <- varname_res
  coxreg <- survival::coxph(fmla, x)
  varname_res$martingale[2:10] <- residuals(coxreg, type = "martingale", weighted = FALSE)
  varname_res$devres[2:10] <- residuals(coxreg, type = "deviance", weighted = FALSE)
  expect_identical(varname_res, make_resids(varname_test, "age2", "event",
                                    covars = c("cov1", "cov2")))
  expect_equal(list(dat = varname_res, coxreg = coxreg),
               make_resids(varname_test, "age2", "event", keep_reg = TRUE,
                               covars = c("cov1", "cov2")))

})
