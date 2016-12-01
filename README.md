Utility Functions for Plotting in R
===================================

[![Build Status](https://travis-ci.org/idot/idoplots.svg?branch=master)](https://travis-ci.org/idot/idoplots)
[![codecov](https://codecov.io/gh/idot/idoplots/branch/master/graph/badge.svg)](https://codecov.io/gh/idot/idoplots)
[![Coverage Status](https://coveralls.io/repos/github/idot/idoplots/badge.svg?branch=master)](https://coveralls.io/github/idot/idoplots?branch=master)

Install
-------

```R
install_github("idot/idoplots")
```

Functions
---------
* discrete_fill() and discrete_colour() for ggplot2
  creates a discrete colour scale based on brewer for n <= 9 and hues ("I want hues") for n > 9 
  ```R
     ggplot2::ggplot(data.frame(x=c("A","B","C"),y=1:3), aes(x=x,y=y,fill=x)) + geom_bar(stat="identity") + discrete_fill()
  ```




