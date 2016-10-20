#' Tuik city sales aggregated
#'
#' City sales are per month. This function creates variations.
#'
#' @param total whether the sales should be aggregated in total. default is
#'    per month.
#' @param istanbul_part whether istanbul continent part should be added to city.
#'    If added, this will be an approximation based on the
#'    \code{\link{town_sales}} data.
#' @param first_total_ratio if \code{TRUE}, first sales ratio to total sales
#'    ratio is added with the argument name.
#'
#' @export
get_city_sales <- function(istanbul_part = FALSE,
                           first_total_ratio = FALSE,
                           start_date = NULL,
                           end_date = NULL) {
  # Approximating for İstanbul parts if requested
  if (istanbul_part) {
    city_sales <- add_istanbul_part_city_sales(city_sales)
  }

  # Putting first_hand and second_hand in their own column
  city_sales <- artuik::city_sales %>%
    tidyr::spread(sale_type, sale)

  # Getting the ratio of first hand sales to total sales
  city_sales <- if (first_total_ratio) {
    city_sales %>%
      dplyr::mutate(first_total_ratio = first_hand / (first_hand + second_hand))
  } else {
    city_sales
  }

  city_sales
}

#' Add istanbul part to city sales
#'
#' This is harder than it sounds. City sales data provided by tuik doesn't
#' seperate İstanbul to continents. This is approximated using the
#' \code{town_sales} data. Since we know each part of İstanbul's towns,
#' a ratio is calculated and then used to seperate first_hand and second_hand
#' sales for each part of İstanbul.
#'
#' @export
add_istanbul_part_city_sales <- function(city_sales) {
  no_istanbul <- artuik::city_sales %>%
    dplyr::filter(city != "İstanbul")

  istanbul_w_parts <- city_sales %>%
    dplyr::filter(city == "İstanbul") %>%
    dplyr::left_join(get_europe_istanbul_ratio(), by = c("year", "month")) %>%

    # If there is a date period for which the ratio is not available, use
    # the average ratio for all available data.
    dplyr::mutate(europe_istanbul_ratio = ifelse(
      is.na(europe_istanbul_ratio),
      get_europe_istanbul_ratio(average = TRUE),
      europe_istanbul_ratio)) %>%

    # Calculating for each part
    dplyr::mutate(`İstanbul (Avrupa)`  = round(sale * europe_istanbul_ratio, 0)) %>%
    dplyr::mutate(`İstanbul (Anadolu)` = sale - `İstanbul (Avrupa)`) %>%

    # These values are not necessary
    dplyr::select(-city, -europe_istanbul_ratio, -sale) %>%

    # Putting the new city value
    tidyr::gather(city, sale, `İstanbul (Avrupa)`, `İstanbul (Anadolu)`)

  dplyr::bind_rows(no_istanbul, istanbul_w_parts)
}
