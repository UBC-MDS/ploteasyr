library(dplyr)
library(ggplot2)
library(tidyverse)
library(assertthat)

#' Scatter Plot Function
#'
#' @description Takes a dataframe and returns a scatterplot of chosen numeric features in the dataset
#'
#' @param data A data frame or a tibble.
#' @param xcol A numerical column .
#' @param ycol A numerical column.
#' @param color A categorical column.
#' @param title An optional character variable spefified by users.
#' @param size An optional integer variable spefified by users for the text size of all labels.
#'
#' @return A scatter plot.
#'
#' @import dplyr
#' @import ggplot2
#' @import tidyverse
#'
#' @export
#'
#' @examples
#' plot_scatter(iris, xcol = Sepal.Length, ycol = Sepal.Width,
#' color = Species, title = "Sepal.Length vs Sepal.Width", size = 20)

plot_scatter <- function(data, xcol, ycol, color, title=NULL, size = 20) {
    if (!is.data.frame(data)) {
        stop("`data` must be entered as a dataframe or a tibble")
    }


    if (!is.numeric(data %>% pull({{ xcol }}))) {
        stop("`xcol` must be a numerical column")
    }

    if (!is.numeric(data %>% pull({{ ycol }}))) {
        stop("`ycol` must be a numerical column")
    }

    if (!is.factor(data %>% pull({{ color }}))) {
        stop("`color` must be a categorical factor")
    }

    if (!is.character(title)) {
        stop("`title` must be a character")
    }

    if (!is.double(size)) {
        stop("`size` must be a positive integer")
  }

    scatter_plot <- ggplot(data, aes(x = {{xcol}}, y = {{ycol}}, color = {{color}})) +
      geom_point() +
      ggtitle(title) +
      theme(text = element_text(size = size))

    return(scatter_plot)

}

