library(tidyverse)
library(here)

# Both \N and empty strings to be treated as NAs
title_basics_raw <- read_tsv(here("raw/title_basics_raw.tsv"), na = c("\\N", ""), show_col_types = FALSE)

# Filter only movies and TVepisodes > save in tmp
filtered_movies_TVepisodes <- title_basics_raw %>% 
  filter(titleType %in% c("movie", "tvEpisode"))

# Output cleaned data
write_tsv(filtered_movies_TVepisodes, here("gen/tmp/filtered_movies_TVepisodes.tsv"))
