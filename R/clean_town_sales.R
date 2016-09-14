#' Town apartment sales of Turkey
#'
#' A dataset containing apartment sales of Turkey's towns
#'
#' @format A data.frame with 5 variables
#' \describe{
#'    \item{city}{name of the city}
#'    \item{town}{name of the town}
#'    \item{year}{year the measurement was taken}
#'    \item{month}{month the measurement was taken}
#'    \item{sale}{amount of the sale}
#' }
#'
#' @source explained extensively on \code{inst/extdata/README.md}
"town_sales"

#' Cleaning town sales data from TUIK
#'
#' The process of obtaining raw data is explained in
#' \code{inst/extdata/README.md}. This function takes that raw data and makes
#' it tidy data.
#'
#' Data generated from here is later put into \code{data} folder by
#' \code{devtools::use_data()}
#'
#' @param file_path path of the city sales data folder
#' @export
clean_town_sales <-
  function(folder_path = system.file("extdata/town_sales",
                                     package = "artuik")) {
    clean_file <- function(file_path) {
      readr::read_delim(
        file.path(folder_path, file_path),
        delim = "|",
        col_names = c("city_town",
                      "year",
                      "month",
                      "sale",
                      "NA_COLUMN"),
        col_types = readr::cols_only(
          city_town = "c",
          year = "i",
          month = "c",
          sale = "d"
        ),
        skip = 4
      ) %>%
        remove_last_NA_row()
    }

    # The reason this assignment done is because `mutate_each` of `dplyr`
    # can't use namespaced functions
    fill_merged_cells <- arutil::fill_merged_cells

    # Cleaning all files in the folder and binding their rows
    dplyr::bind_rows(lapply(dir(folder_path), clean_file)) %>%
      # There are merged cells in the csv, filling them with the last
      # seen value.
      dplyr::mutate_each(dplyr::funs(fill_merged_cells),
                         city_town, year) %>%

      # Splitting city and town to different variables
      split_city_town() %>%

      dplyr::mutate(month = get_tuik_month(month)) %>%

      # Ordering columns
      dplyr::select(city, town, year, month, sale)

  }
