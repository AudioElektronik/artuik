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
