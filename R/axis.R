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


#' https://stackoverflow.com/questions/7705345/how-can-i-extract-plot-axes-ranges-for-a-ggplot2-object/35372274#35372274
#' gets the limit of the plot
#'
#' @return list of min, max
#' 
#'
#' @export
get_plot_limits <- function(plot) {
    gb = ggplot_build(plot)
    xmin = gb$layout$panel_params[[1]]$x.range[1]
    xmax = gb$layout$panel_params[[1]]$x.range[2]
    ymin = gb$layout$panel_params[[1]]$y.range[1]
    ymax = gb$layout$panel_params[[1]]$y.range[2]
    list(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax)
}


#' returns min and max of both scales 
#'
#'
#' @export
get_plot_range <- function(plot) {
   l <- get_plot_limits(plot)
   list(min=min(l$xmin,l$ymin),max=max(l$xmax,l$ymax))
}

#' creates a square plot
#'
#' @examples
#' df <- data.frame(x=1:10,y=11:21)
#' p1 <- ggplot(df, aex(x=x,y=y)) + geom_point()
#' p1
#' p1 magrittr::`%>%` square_plot()  
#'
#' @export
square_plot <- function(plot){
  lims <-  idoplots::get_plot_range(plot)
  p + coord_equal() + xlim(lims$min, lims$max) + ylim(lims$min, lims$max)
}


