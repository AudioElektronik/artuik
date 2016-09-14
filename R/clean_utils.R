#' Remove last row if its filled with \code{NA}'s
#'
#' This is a comman case among CSV obtained from TUIK.
#' This function is used during the cleaning process.
remove_last_NA_row <- function(frame) {
  last_row <- tail(frame, n = 1)

  # Checking if all data in that row is NA
  all_na <- all(sapply(last_row, is.na))

  # If it is, removing it from the result
  if (all_na) {
    head(frame, n = -1)
  } else {
    frame
  }
}

#' Split concatanated city and town data
#'
#' TUIK data merges city and town data in this format: "Adana(Aladağ)".
#' Cleaner functions in this package puts them in a column called
#' \code{city_town}. This function seperates them and returns them in seperate
#' \code{city} and \code{town} varialables.
split_city_town <- function(frame) {
  frame %>%
    dplyr::mutate(town = arutil::get_regex_pattern(city_town, "\\((.*)\\)$")) %>%
    dplyr::mutate(city = arutil::get_regex_pattern(city_town, "^(.*)\\(")) %>%
    dplyr::select(-city_town)
}

#' Getting month as numeric from TUIK data
#'
#' TUIK gives months like this "01-January". This function is just for getting
#' c(1) out of that.
get_tuik_month <- function(month_vec) {
  as.integer(arutil::get_regex_pattern(month_vec, "([0-9]+)-"))
}

#' @importFrom dplyr %>%
NULL
