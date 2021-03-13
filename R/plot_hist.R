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
#' plot_hist(mtcars, exclude = c())
plot_hist <- function(input_df, density = FALSE, exclude = c(NA), title = ""){
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
    numeric_df<- input_df %>% select(-all_of(exclude)) %>% select_if(is.numeric)
  }else{
    numeric_df<- input_df %>% select_if(is.numeric)
  }
  
  if(length(numeric_df) == 0){
    warning("No column selected. An empty vector will be returned.")
  }
  melt_df <- melt(numeric_df)
  if(density){
    plot <- ggplot(melt_df, aes(x = value))+
      facet_wrap(~variable,scales = "free_x") + 
      geom_density() +
      ggtitle(title)
  }else{
    plot <- ggplot(melt_df, aes(x = value))+
      facet_wrap(~variable,scales = "free_x") + 
      geom_histogram() +
      ggtitle(title)
  }
  return(plot)
  
}