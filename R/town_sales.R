#' Get town sales data
#'
#' Getting the TUIK \code{town_sales} data. Also creates some derivations with
#' function arguments.
#'
#' @param istanbul_part Adds istanbul continent part to the city variable
#' @param first_sale approximates first hand house sales using the
#'    \code{city_sales} data. This is only an approximation. This data is not
#'    provided by TUIK for towns.
#'
#' @export
get_town_sales <- function(istanbul_part = FALSE,
                           first_sale = FALSE) {
  town_sales <- if (istanbul_part) {
    arutil::add_istanbul_part(town_sales)
  } else {
    artuik::town_sales
  }

  if (first_sale) {
    # If first sales are requested, getting each cities first sales to
    # total sale ratio to make an approximation
    city_sales <- get_city_sales(first_total_ratio = TRUE,
                                 istanbul_part = istanbul_part) %>%
      dplyr::select(city, year, month, first_total_ratio)

    # Merging the city ratio list with the town sales list. For each town
    # the same ratio will be used. This is just an approximation
    town_sales <- town_sales %>%
      # Most likely there will be no NA's on the join because city sales
      # data exists for wider date range.
      dplyr::left_join(city_sales, by = c("city", "year", "month")) %>%
      dplyr::mutate(first_hand = round(first_total_ratio * sale, 0)) %>%
      dplyr::select(-first_total_ratio)
  }

  town_sales
}

#' (Istanbul europe side home sales / Istanbul home sales) ratio
#'
#' \code{town_sales} data has the granularity to calculate this ratio.
#' Here the calcualted ratio is the total home sales. Normally \code{town_sales}
#' data is not complete for each town of a city but Istanbul is the biggest
#' city so it is complete in this case.
#'
#' @param get historical average, rather then returning the ratio per month.
#'
#' @export
get_europe_istanbul_ratio <- function(average = FALSE) {
  # Filtering all istanbul data and disregarding towns to have a base
  # for the ratio
  all_istanbul <- town_sales %>%
    dplyr::filter(city == "İstanbul") %>%
    dplyr::group_by(city, year, month) %>%
    dplyr::summarise(istanbul = sum(sale)) %>%
    dplyr::ungroup() %>%
    dplyr::select(-city)

  # Getting the europe side data
  europe <- arutil::add_istanbul_part(town_sales) %>%
    dplyr::filter(city == "İstanbul (Avrupa)") %>%
    dplyr::group_by(city, year, month) %>%
    dplyr::summarise(europe = sum(sale)) %>%
    dplyr::ungroup() %>%
    dplyr::select(-city)

  # Joining them together to get the ratio
  ratio_per_month <- all_istanbul %>%
    dplyr::left_join(europe, by = c("year", "month")) %>%
    dplyr::mutate(europe_istanbul_ratio = europe / istanbul)

  if (average) {
    sum(ratio_per_month$europe) / sum(ratio_per_month$istanbul)
  } else {
    ratio_per_month %>%
      dplyr::select(year, month, europe_istanbul_ratio)
  }
}

