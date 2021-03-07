#' Scatter Plot Function
#'
#' Takes a dataframe and returns a scatterplot of chosen numeric features in the dataset
#'
#' @param data A data frame or a tibble.
#' @param x A character variable.
#' @param y A character variable.
#' @param color A color specified by users.
#' @param title An optional character variable spefified by users.
#' @param plot_height An optional integer variable spefified by users.
#' @param plot_width An optional integer variable spefified by users.
#'
#' @return A scatter plot. 
#' @export
#'
#' @examples
#'
#' scatter_plot(mtcars, x = "Horsepower", y = "Acceleration, color = "green", title = "Horsepower vs Acceleration", plot_width=400, plot_height=400)

scatter_plot <- function(data, x, y, color="green", title="Scatter plot", plot_width = 300, plot_height = 300){
}


#' Bind two factors
#'
#' Create a new factor from two existing factors, where the new factor's levels
#' are the union of the levels of the input factors.
#'
#' @param a factor
#' @param b factor
#'
#' @return factor
#' @export
#' @examples
#' plot_bar(iris$Species[c(1, 51, 101)], PlantGrowth$group[c(1, 11, 21)])
plot_bar <- function(a, b) {
  factor(c(as.character(a), as.character(b)))
}
