context("Cleaner functions")

test_that("Tests that town population has all the population for towns", {
  town_population <- clean_town_population()

  city_town <- town_population %>%
    dplyr::mutate(city_town = paste(city, town)) %>%
    .$city_town

  total_population <- sum(town_population$population, na.rm = FALSE)

  # Make sure towns are correct. Test will fail if towns change
  expect_equal_to_reference(sort(city_town), "city_town.rds")

  # We won't fall below 70.000.000 people, test will fail in case of a
  # catastrophy.
  expect_gt(total_population, 7 * (10 ^ 7))
})

test_that("Tests that city sales data is clean compared to the reference", {
  city_sales <- clean_city_sales()

  # Check that columns are same
  expect_equal(colnames(city_sales),
               c("city", "sale_type", "year", "month", "sale"))

  # Check that  first-hand and second-hand is recorded properly
  expect_equal(sort(unique(city_sales$sale_type)),
               c("first_hand", "second_hand"))

  # When new data is downloaded from tuik, this part will fail
  expect_equal_to_reference(city_sales, "city_sales.rds")
})

test_that("Tests that town sales data is clean compared to the reference", {
  town_sales <- clean_town_sales()

  # Check that columns are same
  expect_equal(colnames(town_sales),
               c("city", "town", "year", "month", "sale"))

  # When new data is downloaded from tuik, this part will fail
  expect_equal_to_reference(town_sales, "town_sales.rds")
})
