test_that("inputting 1 yields active", {
  expect_equal(recode_activ(1), "active")
})

test_that("inputting 0 yields inactive", {
  expect_equal(recode_activ(0), "inactive")
})

test_that("inputting (nothing) yields (nothing)", {
  expect_equal(recode_activ(), NA)
})

test_that("inputting anything else yields unknown active state", {
  expect_equal(recode_activ(5), "Unknown activ value")
})
