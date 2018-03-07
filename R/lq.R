#' Low level query tool
#'
#' @export
#' @param x a list
#' @param program a `jqr` query, see [jqr::jq()]
#' @param ... args passed on to [jsonlite::fromJSON()]
#' @examples
#' x <- list(a = list(b = list(c = 1:10, d = 1:10)))
#' lq(x, ".")
#' lq(x, ".[]")
#' lq(x, ".[][]")
#' lq(x, ".[][] | keys | reverse")
lq <- function(x, program, ...) {
  UseMethod("lq", x)
}

#' @export
lq.default <- function(x, program, ...) {
  stop('no "lq" method for ', class(x)[[1L]], call. = FALSE)
}

#' @export
lq.list <- function(x, program, ...) {
  tmp <- jqr::jq(jsonlite::toJSON(x), program)
  if (!jsonlite::validate(tmp)) tmp <- jqr::combine(tmp)
  jsonlite::fromJSON(tmp, ...)
}

