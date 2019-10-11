## code to prepare `taxonomy` dataset goes here

taxonomy <- readr::read_csv("data-raw/taxonomy.csv")

usethis::use_data(taxonomy)
