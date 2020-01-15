lq
==



[![Build Status](https://travis-ci.org/ropensci/lq.svg?branch=master)](https://travis-ci.org/ropensci/lq)

List queries

leveraging `jqr`, an R interface to jq, a JSON processor http://stedolan.github.io/jq/

## Installation


```r
remotes::install_github("ropensci/lq")
```


```r
library(lq)
```

## Interfaces

### low level


```r
(x <- list(a = list(b = list(c = 1, d = 2, e = 3)), f = 45))
#> $a
#> $a$b
#> $a$b$c
#> [1] 1
#>
#> $a$b$d
#> [1] 2
#>
#> $a$b$e
#> [1] 3
#>
#>
#>
#> $f
#> [1] 45
```


```r
lq(x, ".[][] | keys | reverse")
#> [1] "e" "d" "c"
```

### high level


```r
library(jqr)
(tj(x) %>% index()) %>% fj
#> [[1]]
#> [[1]]$b
#> [[1]]$b$c
#> [1] 1
#>
#> [[1]]$b$d
#> [1] 2
#>
#> [[1]]$b$e
#> [1] 3
#>
#>
#>
#> [[2]]
#> [1] 45
(tj(x) %>% index() %>% index()) %>% fj
#> $c
#> [1] 1
#>
#> $d
#> [1] 2
#>
#> $e
#> [1] 3
(tj(x) %>% index() %>% index() %>% select(. > 2)) %>% fj
#> $c
#> [1] 1
#>
#> $d
#> [1] 2
#>
#> $e
#> [1] 3
(tj(x) %>% index() %>% select(. > 2)) %>% fj
#> [[1]]
#> [[1]]$b
#> [[1]]$b$c
#> [1] 1
#>
#> [[1]]$b$d
#> [1] 2
#>
#> [[1]]$b$e
#> [1] 3
#>
#>
#>
#> [[2]]
#> [1] 45
(tj(x) %>% index() %>% index() %>% keys() %>% reverse) %>% fj
#> [1] "e" "d" "c"
```

## TODO

* make hooks like in `jqr` so that we automatigically convert json back to list instead of needing `fj()` at the end of a high level DSL workflow
* similarly, make `tj()` unneccesary
* other smart things with lists ... 😏

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/lq/issues).
* License: MIT
* Get citation information for `lq` in R doing `citation(package = 'lq')`
* Please note that this project is released with a [Contributor Code of Conduct][coc]. By participating in this project you agree to abide by its terms.

[![rofooter](http://www.ropensci.org/public_images/github_footer.png)](http://ropensci.org)

[coc]: https://github.com/ropensci/lq/blob/master/CODE_OF_CONDUCT.md
