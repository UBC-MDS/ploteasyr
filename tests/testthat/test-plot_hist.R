test_that("Input validation works", {
  expect_error(plot_hist("Not a dataframe"))
  expect_error(plot_hist(mtcars, density = "Not a boolean"))
  expect_error(plot_hist(mtcars, exclude = "Not a vector"))
  expect_error(plot_hist(mtcars, exclude = c("Column not in the dataframe")))
})


