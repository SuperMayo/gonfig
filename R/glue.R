#' Recursive glue
#'
#' Recursively glue the string using environment until convergence.
#'
#' @param string :Maybe character\cr Maybe a character string.
#' @param env :list\cr An environment, list or data frame used to lookup values.
#' @param .open :character\cr Opening delimiter
#' @param .close :character\cr Closing delimiter
#'
#' @return :character\cr A glued string.
#'
#' @importFrom glue glue_data
#'
rglue <- function(string, env, .open, .close) {
  glued <- glue_data(env, string, .open = .open, .close = .close)
  if(glued == string){
    return(string)
  } else {
    rglue(glued, env, .open, .close)
  }
}
