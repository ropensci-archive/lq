#' Higher level query tools
#'
#' @name lq-dsl
#' @examples
#' (x <- list(a = list(b = list(c = 1, d = 2, e = 3)), f = 45))
#' 
#' library(jqr)
#' (tj(x) %>% index()) %>% fj
#' (tj(x) %>% index() %>% index()) %>% fj
#' (tj(x) %>% index() %>% index() %>% select(. > 2)) %>% fj
#' (tj(x) %>% index() %>% select(. > 2)) %>% fj
#' (tj(x) %>% index() %>% index() %>% keys() %>% reverse) %>% fj
NULL
