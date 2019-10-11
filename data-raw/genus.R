## code to prepare `genus` dataset goes here
library(readr)
library(dplyr)

raw <- read_csv("data-raw/genus.csv",
                col_types = cols(
                  .default = col_integer(),
                  genus_id = col_character()
                ))

genus <- raw %>%
  select(-genus_id) %>%
  as.matrix
rownames(genus) <- raw[["genus_id"]]

usethis::use_data(genus)
