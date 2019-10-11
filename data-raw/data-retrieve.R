# Create fake data
library(mecdata)
library(tidyverse)

nn <- 100
ids <-  paste0("sample", str_pad(1:nn, nchar(nn), pad = "0"))
set.seed(595959)

# Taxonomy
taxa %>%
  distinct(kingdom, phylum, class, order, family, genus, genus_id) %>%
  write_csv("data-raw/taxonomy.csv")

# Genus counts
genera %>%
  select(id = stool_id, genus_id, count_all) %>%
  group_by(genus_id) %>%
  sample_n(nn) %>%
  mutate(id = ids) %>%
  spread(id, count_all) %>%
  write_csv("data-raw/genus.csv")

# Sample data
get_random <- function(x, digits = 2) {
  runif(nn, min(x, na.rm = TRUE), max(x, na.rm = TRUE)) %>%
    round(digits)
}
tibble(
  id = ids,
  age = get_random(survey2$OST_age),
  sex = sample(survey2$Q1_sex, nn),
  ethnicity = sample(survey2$Q1_eth, nn),
  height = get_random(survey2$OCL_anthro_height_m),
  weight = get_random(survey2$OCL_anthro_weight_kg),
  sample_month = sample(1:12, nn, replace = TRUE),
  sample_year = sample(2013:2015, nn, replace = TRUE),
  sample_area = sample(factor(c("L1", "L2")), nn, replace = TRUE),
  batch = sample(samples$batch_correct, nn)
) %>%
  write_csv("data-raw/sample_data.csv")
