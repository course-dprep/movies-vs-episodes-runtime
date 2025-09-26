# In this directory, you will keep all source code files relevant for 
# preparing/cleaning your data.

# Step 0: Ensure the "tmp" folder exists
dir.create("tmp", recursive = TRUE, showWarnings = FALSE)

# Step 1: Both \N and empty strings to be treated as NAs
library(readr)
library(tidyverse)
title_basics_raw <- read_tsv("raw/title_basics_raw.tsv", na = c("\\N", ""), show_col_types = FALSE)
ratings_raw <- read_tsv("raw/ratings_raw.tsv", na = c("\\N", ""), show_col_types = FALSE)

# Step 2: Filter only movies and TVepisodes > save in tmp
filtered_movies_TVepisodes <- title_basics_raw %>% 
  filter(titleType %in% c("movie", "tvEpisode"))

write_tsv(filtered_movies_TVepisodes, "tmp/filtered_movies_TVepisodes.tsv")

# Step 3: Merge with ratings
merged_data <- filtered_movies_TVepisodes %>% 
  left_join(ratings_raw, by = "tconst")

cat("Number of unmatched rows:", nrow(filtered_movies_TVepisodes)-nrow(merged_data), "\n")

# Step 4: Create dummy variable for TVepisodes > save in tmp
merged_data <- merged_data %>% 
  mutate(is_tvepisode = ifelse(titleType == "tvEpisode", 1,0))

write_tsv(merged_data, "tmp/merged_data.tsv")

# Write output
print("Cleaning step 1 finished successfully!")

