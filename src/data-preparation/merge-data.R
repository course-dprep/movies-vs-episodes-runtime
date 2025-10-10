library(tidyverse)
library(here)

filtered_movies_TVepisodes <- read_tsv(here("gen/tmp/filtered_movies_TVepisodes.tsv"), na = c("\\N", ""), show_col_types = FALSE)
ratings_raw <- read_tsv(here("raw/ratings_raw.tsv"), na = c("\\N", ""), show_col_types = FALSE)

# Merge with ratings
merged_data <- filtered_movies_TVepisodes %>% 
  left_join(ratings_raw, by = "tconst")

cat("Number of unmatched rows:", sum(is.na(merged_data$averageRating)), "\n")

#  Create dummy variable for TVepisodes > save in tmp
merged_data <- merged_data %>% 
  mutate(is_tvepisode = ifelse(titleType == "tvEpisode", 1,0))

# Output merged_data
write_tsv(merged_data, here("gen/tmp/merged_data.tsv"))


