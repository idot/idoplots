
#' discrete palette
#'
#' n <= 9: RColorBrewer Set1\cr 
#' n > 9: hues "I want hue"
#'
#'
#' @param n number of colors 
#' @return vector of colors
#'
discrete_palette <- function(n){
   if(n <= 2){
       unname(RColorBrewer::brewer.pal(3, "Set1")[1:n])
   }
   else if(n <= 9){
       unname(RColorBrewer::brewer.pal(n, "Set1"))
   }else{
       unname(hues::iwanthue(n))
   }
}


#' discrete palette for colour aesthetic
#'
#' n <= 9: RColorBrewer Set1\cr  
#' n > 9: hues "I want hue" 
#'
#' @return discrete scale
#' 
#' @examples
#' ggplot2::ggplot(data.frame(x=c("A","B","C"),y=1:3), ggplot2::aes(x=x,y=y,colour=x)) + ggplot2::geom_point() + discrete_colour()
#'
#' @export discrete_color discrete_colour
discrete_color <- discrete_colour <- function(){
   ggplot2::discrete_scale("colour", "manual", discrete_palette)
}


#' discrete palette for fill aesthetic
#' 
#' n <= 9: RColorBrewer Set1\cr 
#' n > 9: hues "I want hue"
#'
#' @return discrete scale
#' 
#' @examples
#' ggplot2::ggplot(data.frame(x=c("A","B","C"),y=1:3), ggplot2::aes(x=x,y=y,fill=x)) + ggplot2::geom_bar(stat="identity") + discrete_fill()
#'
#' @export
discrete_fill <- function(){
   ggplot2::discrete_scale("fill", "manual", discrete_palette)
}


#' continuous palette for fill aesthetic
#' with BTY blue to yellow
#'
#' 
#' @return continuous scale
#'
#' @examples
#' ggplot2::ggplot(data.frame(x=1,y=1:255), ggplot2::aes(x=x,y=y,fill=y)) + ggplot2::geom_bar(stat="identity") + scale_fill_bty()
#'
#' @export
scale_fill_bty <- function(){
   ggplot2::continuous_scale("fill", "bty", function(val){ hexbin::BTY(256)[floor(val*256)] })   
}


#' continuous palette for color aesthetic
#' with BTY blue to yellow
#'
#'
#' @return continuous scale
#' @examples 
#' ggplot2::ggplot(data.frame(x=1,y=1:255), ggplot2::aes(x=x,y=y,color=y)) + ggplot2::geom_bar(stat="identity") + scale_color_bty()
#'
#' @export
scale_color_bty <- function(){
   ggplot2::continuous_scale("colour", "bty", function(val){ hexbin::BTY(256)[ceiling(val*256)] })
}



