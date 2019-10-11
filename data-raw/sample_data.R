## code to prepare `sample_data` dataset goes here
library(readr)

sample_data <- read_csv("data-raw/sample_data.csv",
                        col_types = cols(
                          id = col_character(),
                          age = col_double(),
                          sex = col_character(),
                          ethnicity = col_character(),
                          height = col_double(),
                          weight = col_double(),
                          sample_month = col_integer(),
                          sample_year = col_integer(),
                          sample_area = col_character(),
                          batch = col_character()
                        ))

usethis::use_data(sample_data)
