#' correlation number plot for ggpair upper 
#' 
#' it would be nice to
#' a) have a scale outside of the plot
#' b) have one zoomed in scale for the plot, but I think one would have to do all correlations and then
#'     pass the range to the function
#'
#'
#' https://github.com/ggobi/ggally/issues/139 
#'
#' @param corRange 
#' the range of the expected correlation, color values outside of specified range will be truncated
#'
#' @return plot
#'
#' @examples
#'
#' cor_color(iris, ggplot2::aes(x=Sepal.Length, y=Sepal.Width)) 
#' 
#' GGally::ggpairs(iris[,1:4], upper=list(continuous = cor_color), lower=list(continuous = GGally::wrap(GGally::ggally_points, size = 1, color = "black")), progress=FALSE)
#'
#'
#'
#'
#' @export 
cor_color <- function(data, mapping, color = I("black"), sizeRange = c(1, 5), corRange = c(-1,1), ...) {
   
  # get the x and y data to use the other code
  x <- (rlang::eval_tidy(mapping$x, data)) 
  y <- (rlang::eval_tidy(mapping$y, data))
  ct <- cor.test(x,y)
  
  r <- unname(ct$estimate)
  rt <- format(r, digits=2)[1]
  tt <- as.character(rt)
  
  # plot the cor value
  p <- GGally::ggally_text(
    label = tt, 
    mapping = aes(),
    xP = 0.5, yP = 0.5, 
    size = 6,
    color=color,
    ...
  ) +
    
    theme(
      panel.background=element_blank(),
      panel.grid.minor=element_blank(),
      panel.grid.major=element_blank()
    ) 
  
  lower <- corRange[1]
  upper <- corRange[2]
  bin <- scaleRangeValue(lower, upper, r, 256) 

  corCol <- viridis::viridis_pal()(256)[bin]  
  
  p <- p + theme(
    panel.background = element_rect(fill= corCol)
  )
  
  p
}


#' scales a value of a range into a bin
#' 
#' 
#'
#' @export
scaleRangeValue <- function(lower, upper, value, bincount){
  shift <- 0 - lower
  upperShift <- upper + shift   
  if(value < lower){
     value <- lower
  }
  if(value > upper){
     value <- upper
  }
  round((bincount - 1)/upperShift * (value + shift) + 1) 
}



