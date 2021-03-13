#' Scatter Plot Function
#'
#' Takes a dataframe and returns a scatterplot of chosen numeric features in the dataset
#'
#' @param data A data frame or a tibble.
#' @param xcol A character variable.
#' @param ycol A character variable.
#' @param color A color specified by users.
#' @param title An optional character variable spefified by users.
#' @param size An optional integer variable spefified by users for the text size of all labels.
#'
#' @return A scatter plot. 
#' @export
#'
#' @examples
#'
#' scatter_plot(iris, xcol = Sepal.Length, ycol = Sepal.Width, color = Species, title = "Sepal.Length vs Sepal.Width", size = 20)


scatter_plot <- function(data, xcol, ycol, color, title=NULL, size = 20) {
    if (!is.data.frame(data)) {
        stop("`data` must be entered as a dataframe or a tibble")
    }


    if (!is.numeric(data %>% pull({{ xcol }}))) {
        stop("`x` must be a numerical column")
    }

    if (!is.numeric(data %>% pull({{ ycol }}))) {
        stop("`y` must be a numerical column")
    }

    if (!is.factor(data %>% pull({{ color }}))) {
        stop("`color` must be a categorical factor")
    }

    if (!assertthat::is.string(title)) {
        stop("`title` must be a string")
    }
    
    ggplot(data, aes(x = {{xcol}}, y = {{ycol}}, color = {{color}})) +
      geom_point() +
      ggtitle(title) +
      theme(text = element_text(size = size))    
}

