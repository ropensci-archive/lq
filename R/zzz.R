cpt <- function(l) Filter(Negate(is.null), l)

#' to json
#' @export
#' @param x a list
tj <- function(x) jsonlite::toJSON(x, auto_unbox = TRUE)

#' from json
#' @export
#' @param x json string
#' @param ... args passed on to [jsonlite::fromJSON()]
fj <- function(x, ...) {
  if (!jsonlite::validate(x)) x <- jqr::combine(x)
  jsonlite::fromJSON(x, ...)
}
