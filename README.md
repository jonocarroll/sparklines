
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sparklines

<!-- badges: start -->
<!-- badges: end -->

Following the excellent {[reactR](https://github.com/react-R/reactR/)}
[tutorial](https://react-r.github.io/reactR/articles/intro_htmlwidgets.html)
on wrapping a React library, namely
[react-sparklines](https://github.com/borisyankov/react-sparklines).

## Example

This is successful, and produces a nice sparkline

``` r
sparklines(rnorm(10), sparklinesLine())
```

![](man/figures/README-sparklines.png)

More could be wrapped, but this was a nice proof-of-concept.
