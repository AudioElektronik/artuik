#' Getting cities available in tuik
#'
#' This function returns the cities of Turkey according to tuik data.
#'
#' @export
tuik_city <- function() {
  tuik_town() %>%
    distinct(city) %>%
    .$city
}


#' Getting towns available in tuik
#'
#' This function returns the towns of Turkey according to tuik data.
#'
#' @export
tuik_town <- function() {
  town_population %>%
    dplyr::distinct(city, town)
}
