library(tidyverse)
library(here)

# Ensure the "raw" folder exists
dir.create(here("raw"), recursive = TRUE, showWarnings = FALSE)

# Ensure the "gen" folder exists
dir.create(here("gen/tmp"), recursive = TRUE, showWarnings = FALSE)
dir.create(here("gen/output"), recursive = TRUE, showWarnings = FALSE)

# Download and Save function
download_and_save <- function(url, file) write_tsv(read_tsv(url, na = c("\\N", "")), here(file))

# Retrieve datasets
datasets <- c(
  "raw/title_basics_raw.tsv" = "https://datasets.imdbws.com/title.basics.tsv.gz",
  "raw/ratings_raw.tsv"     = "https://datasets.imdbws.com/title.ratings.tsv.gz")

# Save the downloaded datasets to folder "raw"
walk2(datasets, names(datasets), download_and_save)