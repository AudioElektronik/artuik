#' Get town population data
#'
#' Getting the TUIK \code{town_population} data.
#'
#' @param istanbul_part Adds istanbul continent part to the city variable
#'
#' @export
get_town_population <- function(istanbul_part = FALSE) {
  if (istanbul_part) {
    arutil::add_istanbul_part(town_population)
  } else {
    town_population
  }
}
