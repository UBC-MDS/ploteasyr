test_that("Data should be a dataframe", {
  expect_error(plot_scatter("Not a dataframe"))
})

test_that("xcol should be a numerical variable", {
  expect_error(plot_scatter(iris, xcol = Species, ycol = Sepal.Width, color = Species, title = "Sepal.Length vs Sepal.Width", font_size = 20))
})

test_that("ycol should be a numerical variable", {
  expect_error(plot_scatter(iris, xcol = Sepal.Length, ycol = Species, color = Species, title = "Sepal.Length vs Sepal.Width", font_size = 20))
})

test_that("Color should be a categorical variable", {
  expect_error(plot_scatter(iris, xcol = Sepal.Length, ycol = Sepal.Width, color = Petal.Length, title = "Sepal.Length vs Sepal.Width", font_size = 20))
})

test_that("title should be a character", {
  expect_error(plot_scatter(iris, xcol = Sepal.Length, ycol = Sepal.Width, color = Species, title = 3, font_size = 20))
})

test_that("size should be a positive integer", {
  expect_error(plot_scatter(iris, xcol = Sepal.Length, ycol = Sepal.Width, color = "Sepal.Length vs Sepal.Width", title = 3, font_size = "Not a number"))
})

