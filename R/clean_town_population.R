#' Town population of Turkey
#'
#' A dataset containing all of Turkey's towns populations
#'
#' @format A data.frame with 4 variables
#' \describe{
#'    \item{city}{name of the city}
#'    \item{town}{name of the town}
#'    \item{year}{year the measurement was taken}
#'    \item{population}{population of the town}
#' }
#'
#' @source explained extensively on \code{inst/extdata/README.md}
"town_population"

#' Cleaning town population data from TUIK
#'
#' The process of obtaining raw data is explained in
#' \code{inst/extdata/README.md}. This function takes that raw data and makes
#' it tidy data.
#'
#' Data generated from here is later put into \code{data} folder by
#' \code{devtools::use_data()}
#'
#' @param file_path path of the town population raw data
#' @export
clean_town_population <-
  function(file_path = system.file("extdata/town_population.csv",
                                   package = "artuik")) {
    readr::read_delim(
      file_path,
      delim = "|",
      col_names = c("city_town",
                    "year",
                    "population",
                    "NA_COLUMN"),
      col_types = readr::cols_only(
        city_town = "c",
        year = "i",
        population = "d"
      ),
      skip = 5
    ) %>%
      remove_last_NA_row() %>%
      split_city_town() %>%
      dplyr::select(city, town, year, population)
  }
