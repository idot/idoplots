#' combines multiple plots with shared legend
#' 
#' from https://github.com/tidyverse/ggplot2/wiki/share-a-legend-between-two-ggplot2-graphs 
#' 
#' @return plots 
#' 
#' @examples
#' p1 <- ggplot2::ggplot(data.frame(x=c("A","B","C"),y=1:3), ggplot2::aes(x=x,y=y,colour=x)) + ggplot2::geom_point() 
#' p2 <- ggplot2::ggplot(data.frame(x=c("A","B","C"),y=1:3), ggplot2::aes(x=x,y=y,colour=x)) + ggplot2::geom_point()
#' grid_arrange_shared_legend(p1, p2)
#'
#' @export
grid_arrange_shared_legend <- function(..., ncol = length(list(...)), nrow = 1, position = c("bottom", "right")) {

  plots <- list(...)
  position <- match.arg(position)
  g <- ggplotGrob(plots[[1]] + theme(legend.position = position))$grobs
  legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
  lheight <- sum(legend$height)
  lwidth <- sum(legend$width)
  gl <- lapply(plots, function(x) x + theme(legend.position="none"))
  gl <- c(gl, ncol = ncol, nrow = nrow)

  combined <- switch(position,
                     "bottom" = gridExtra::arrangeGrob(do.call(gridExtra::arrangeGrob, gl),
                                            legend,
                                            ncol = 1,
                                            heights = grid::unit.c(unit(1, "npc") - lheight, lheight)),
                     "right" = gridExtra::arrangeGrob(do.call(gridExtra::arrangeGrob, gl),
                                           legend,
                                           ncol = 2,
                                           widths = grid::unit.c(unit(1, "npc") - lwidth, lwidth)))

  grid.newpage()
  grid.draw(combined)

  # return gtable invisibly
  invisible(combined)

}

