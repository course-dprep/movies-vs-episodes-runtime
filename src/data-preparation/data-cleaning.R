library(tidyverse)

# Ensure the "tmp" folder exists
dir.create("tmp", recursive = TRUE, showWarnings = FALSE)

# Both \N and empty strings to be treated as NAs
title_basics_raw <- read_tsv("raw/title_basics_raw.tsv", na = c("\\N", ""), show_col_types = FALSE)

# Filter only movies and TVepisodes > save in tmp
filtered_movies_TVepisodes <- title_basics_raw %>% 
  filter(titleType %in% c("movie", "tvEpisode"))

# Output cleaned data
write_tsv(filtered_movies_TVepisodes, "tmp/filtered_movies_TVepisodes.tsv")
