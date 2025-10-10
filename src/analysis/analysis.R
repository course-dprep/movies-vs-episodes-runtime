library(tidyverse)
library(here)
analysis_data_clean <- read_tsv(here("gen/tmp/analysis_data_clean.tsv"), na = c("\\N", ""), show_col_types = FALSE)

# Change runtimeMinutes to mean
analysis_data_clean <- analysis_data_clean %>%
  mutate(mruntimeMinutes = runtimeMinutes - mean(runtimeMinutes, na.rm = TRUE))

# Change baseline to 1896 
analysis_data_clean <- analysis_data_clean %>%
  mutate(startYearCentered = startYear - 1896)

# Regression with interaction effect controlling for release year
model_1 <- lm(averageRating ~ mruntimeMinutes * is_tvepisode + startYearCentered, data = analysis_data_clean)