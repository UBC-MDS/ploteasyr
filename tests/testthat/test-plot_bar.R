test_that("plot_bar() binds factor (or character)", {
  x <- c("a", "b")
  x_fact <- factor(x)
  y <- c("c", "d")
  z <- factor(c("a", "b", "c", "d"))

  expect_identical(plot_bar(x, y), z)
  expect_identical(plot_bar(x_fact, y), z)
})
