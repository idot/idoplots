

#' format the labels on a log2 scale scientifically
#' 
#' call scale_y_continuous(trans = "log2", labels=log2format(.x), limits = c(2^-3,2^15))
#'
log2format <- function(n){
  scales::trans_format('log2', scales::math_format(2^.x))
}


#' scale the y scale log2 
#' 
#' @param limits default: c(2^-2,2^15)
#'
#'
scale_y_log2 <- function(limits=c(2^-2,2^15)){
   ggplot2::scale_y_continuous(trans = "log2", labels=log2format(.x), limits = limits)
} 


#' scale the x scale log2
#'
#' @param limits default: c(2^-2,2^15)
#'
#' @examples
#' ggplot2::ggplot(data.frame(x=2^(1:10),y=10), ggplot2::aes(x=x,y=y)) + ggplot2::geom_point() + scale_x_log2()
#'
scale_x_log2 <- function(limits=c(2^-2,2^15)){
   ggplot2::scale_x_continuous(trans = "log2", labels=log2format(.x), limits = limits)
}


