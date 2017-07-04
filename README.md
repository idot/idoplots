Utility Functions for Plotting in R
===================================

[![Build Status](https://travis-ci.org/idot/idoplots.svg?branch=master)](https://travis-ci.org/idot/idoplots)
[![codecov](https://codecov.io/gh/idot/idoplots/branch/master/graph/badge.svg)](https://codecov.io/gh/idot/idoplots)
[![Coverage Status](https://coveralls.io/repos/github/idot/idoplots/badge.svg?branch=master)](https://coveralls.io/github/idot/idoplots?branch=master)

Install
-------

```R
devtools::install_github("idot/idoplots")
```

Functions
---------
* discrete_fill() and discrete_colour() for ggplot2
  creates a discrete colour scale based on brewer for n <= 9 and hues ("I want hues") for n > 9 

* xrot() rotates the x-axis labels for ggplot2

```R
   ggplot(data.frame(x=c("A","B","C"),y=1:3), aes(x=x,y=y,colour=x)) + geom_point() + discrete_colour() + xrot()
```

* scale_fill_bty() and scale_color_bty() creates BTY color scale

```R
   ggplot2::ggplot(data.frame(x=1,y=1:255), ggplot2::aes(x=x,y=y,color=y,fill=y)) + ggplot2::geom_bar(stat="identity") + scale_color_bty() + scale_fill_bty()
```




