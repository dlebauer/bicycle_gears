Calculating and Comparing Bicycle Gears
================

**Credit:** the code in bicycle\_gears.R was written by David Roberts
and described in his April 6 2016 blog post from [Cycling gear ratio
calculator for R (or why you should just go buy a SRAM Eagle 1×12 group
right
now)](https://davidrroberts.wordpress.com/2016/04/06/cycling-gear-ratio-calculator-for-r-or-why-you-should-just-go-buy-a-sram-eagle-1x12-group-right-now/).

## Read in data and functions

    ## Warning: package 'dplyr' was built under R version 4.0.3

    ## # A tibble: 69 x 46
    ##    use      brand   speeds small large   T10   T11   T12   T13   T14   T15   T16
    ##    <chr>    <chr>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ##  1 mountain shimano     10    11    34    NA    11    NA    13    NA    15    NA
    ##  2 mountain shimano     10    11    36    NA    11    NA    13    NA    15    NA
    ##  3 mountain shimano     11    11    40    NA    11    NA    13    NA    15    NA
    ##  4 mountain shimano     11    11    42    NA    11    NA    13    NA    15    NA
    ##  5 mountain shimano     11    11    46    NA    11    NA    13    NA    15    NA
    ##  6 mountain sram        10    11    32    NA    11    12    NA    14    15    NA
    ##  7 mountain sram        10    11    36    NA    11    NA    13    NA    15    NA
    ##  8 mountain sram        10    12    32    NA    NA    12    13    14    15    NA
    ##  9 mountain sram        10    12    36    NA    NA    12    13    NA    15    NA
    ## 10 mountain sram        11    10    42    10    NA    12    NA    14    NA    16
    ## # ... with 59 more rows, and 34 more variables: T17 <dbl>, T18 <dbl>,
    ## #   T19 <dbl>, T20 <dbl>, T21 <dbl>, T22 <dbl>, T23 <dbl>, T24 <dbl>,
    ## #   T25 <dbl>, T26 <dbl>, T27 <dbl>, T28 <dbl>, T29 <dbl>, T30 <dbl>,
    ## #   T31 <dbl>, T32 <dbl>, T33 <lgl>, T34 <dbl>, T35 <dbl>, T36 <dbl>,
    ## #   T37 <dbl>, T38 <lgl>, T39 <lgl>, T40 <dbl>, T41 <lgl>, T42 <dbl>,
    ## #   T43 <lgl>, T44 <lgl>, T45 <lgl>, T46 <dbl>, T47 <lgl>, T48 <lgl>,
    ## #   T49 <lgl>, T50 <dbl>

## Make a plot comparing 1x and 2x options

    ## Warning: package 'ggplot2' was built under R version 4.0.3

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->
