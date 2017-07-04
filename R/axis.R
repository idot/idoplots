#' rotates the labels on the x-axis by 90 deg
#'
#' @return theme 
#'
#' @examples
#' ggplot2::ggplot(data.frame(x=c("A","B","C"),y=1:3), ggplot2::aes(x=x,y=y,colour=x)) + ggplot2::geom_point() + xrot()
#'
#' @export 
xrot <- function(){
	theme(axis.text.x=element_text(angle=90,vjust=0.5,hjust=1))
}
