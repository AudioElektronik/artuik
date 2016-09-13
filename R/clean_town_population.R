clean_town_population <-
  function(file_path = system.file("extdata/town_population.csv",
                                   package = "artuik")) {
    raw <-
      read.csv(
        file_path,
        sep = '|',
        stringsAsFactors = FALSE,
        header = FALSE
      )
    stripped <-
      head(raw[, 2:3],-1) # Last row is NA, 1st and 4th column have unnecessary information
    colnames(stripped) <- c('region', 'population')

    town_pop <- stripped %>%
      mutate(city = get_pattern(region, '(.*)\\(')) %>%
      mutate(town = get_pattern(region, '\\((.*)\\)')) %>%
      select(-region)

    audioResearch::make_df_utf8(town_pop)
  }
