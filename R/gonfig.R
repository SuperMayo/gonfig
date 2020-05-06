#' Get given config
#'
#' Read from the currently active configuration as would do config::get and
#' offers you the power of glue with no extra fees.
#'
#' @param value :character\cr Name of value (NULL to read all values)
#' @param .open :character\cr Opening delimiter
#' @param .close :character\cr Closing delimiter
#' @param ... Same arguments as \link[config:get]{config::get}
#'
#' @return :list \cr A list with \emph{config awared} glued element
#'
#' @details For additional details see the package website at
#'  \href{https://github.com/supermayo/gonfig}{https://github.com/supermayo/gonfig}.
#'
#' @seealso \code{\link[config:get]{config::get}},
#' \code{\link[glue:glue_data]{glue::glue_data}}
#'
#' @importFrom magrittr %>%
#'
#' @export
get <- function(value=NULL, .open="{", .close="}", ...){
  active_config <- config::get(...) %>%
    fillList(.open, .close)

  if (!is.null(value))
    active_config[[value]]
  else
    active_config
}


#' Recursively apply glue on each list element
#'
#' @param l :list
#' @param .open :character\cr Opening delimiter
#' @param .close :character\cr Closing delimiter
#'
#' @return :list\cr The full list with glued element
#'
#' @importFrom purrr partial
fillList <- function(l, .open, .close){
  .rglue <- partial(rglue, .open = .open, .close = .close)
  rapply(l, .rglue, env=l, how="list")
}
