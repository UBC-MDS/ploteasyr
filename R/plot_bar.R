library(dplyr)
library(ggplot2)
library(tidyverse)
#' Plot bars for all numerical columns in the given dataframe
#'
#' @description plot bars for all numerical columns in the given data frame.
#'
#' @param input_df The input dataframe
#' @param density The boolean indicating whether or not to plot the density.
#' @param exclude The columns not to include in the output.
#' @param title The title of the histograms
#'
#' @import dplyr
#' @import ggplot2
#' @import tidyverse
#'
#' @return ggplot2 object
#' @export
#'
#' @examples
#' plot_bar(mtcars)

plot_bar <- function(input_df, density = FALSE, exclude = c(NA), title = ""){
  #Input Check
  if(!is.data.frame(input_df)){
    stop("The 'input_df' should be a dataframe. Please check.")
  }
  if(!is.logical(density)){
    stop("The 'density' should be a boolean. Please check")
  }
  if(!is.vector(exclude)){
    stop("The 'exclude' should be a vector. Please check")
  }
  if(!is.character(title)){
    stop("The 'title' should be characters. Please check")
  }
  if((!is.na(exclude)) & (!(exclude %in% colnames(input_df)))){
    stop("Excluding columns which are not present in the input dataframe. Please check.")
  }

  if(!is.na(exclude)){
    numeric_df<- input_df %>% dplyr::select(-all_of(exclude)) %>% dplyr::select_if(is.numeric)
  }else{
    numeric_df<- input_df %>% dplyr::select_if(is.numeric)
  }

  if(length(numeric_df) == 0){
    warning::warning("No column selected. An empty vector will be returned.")
  }
  melt_df <- reshape::melt(numeric_df)
  if(density){
    plot <- ggplot2:ggplot(melt_df, ggplot2::aes(x = value))+
      ggplot2::facet_wrap(~variable, scales = "free_x") +
      ggplot2::geom_density() +
      ggplot2::ggtitle(title)
  }else{
    plot <- ggplot2::ggplot(melt_df, ggplot2::aes(x = value))+
      ggplot2::facet_wrap(~variable, scales = "free_x") +
      ggplot2::geom_histogram() +
      ggplot2::ggtitle(title)
  }
  return(plot)
}


