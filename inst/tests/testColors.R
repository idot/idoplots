context("Colors")



test_that("creates color palette like brewer for n <= 9", {
   brewer <- RColorBrewer::brewer.pal(9, "Set1")
   trainMap <- function(n, f){
     l <- LETTERS[1:n]
     f$train(l)
     expect_equal(f$map(l),brewer[1:n])
   }   
   sapply(1:9, trainMap, discrete_color())
   sapply(1:9, trainMap, discrete_colour())
   sapply(1:9, trainMap, discrete_fill())
})


test_that("creates color palette like hues for n > 9", {
   trainMap <- function(n, or, uour, fill){
     hue <- unname(hues::iwanthue(n))
     l <- LETTERS[1:n]
     or$train(l)
     uour$train(l)
     fill$train(l)
     expect_equal(or$map(l),hue[1:n])
     expect_equal(uour$map(l),hue[1:n])
     expect_equal(fill$map(l),hue[1:n])
   }
   sapply(10:12, trainMap, discrete_color(), discrete_colour(), discrete_fill())
})



