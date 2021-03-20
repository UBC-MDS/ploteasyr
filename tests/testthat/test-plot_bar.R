test_that("Input validation works", {
  expect_error(plot_bar("Not a dataframe"))
  expect_error(plot_bar(mtcars, density = "Not a boolean"))
  expect_error(plot_bar(mtcars, exclude = "Not a vector"))
  expect_error(plot_bar(mtcars, exclude = c("Column not in the dataframe")))
})


