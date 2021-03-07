#' Plot histograms for all numerical columns in the given dataframe
#'
#' @description plot histograms for all numerical columns in the given data frame.
#'
#' @param input_df The input dataframe
#' @param density The boolean indicating whether or not to plot the density.
#' @param exclude The columns not to include in the output.
#' @param title The title of the histograms
#'
#' @return ggplot2 object
#' @export
#'
#' @examples
#' plot_hist(mtcars, exclude = c(""))
plot_hist <- function(input_df, density = FALSE, exclude = c(""), title = "Histogram"){
  
}