# Step 5: Select relevant columns, remove missing values, de-duplicate > save in gen

dir.create("tmp", recursive = TRUE, showWarnings = FALSE)

library(tidyverse)
library(data.table)
analysis_data <- fread("tmp/merged_data.tsv")
analysis_data[, c("originalTitle", "titleType", "isAdult", "endYear", "genres", "numVotes") := NULL]
analysis_data <- analysis_data[!is.na(runtimeMinutes) & !is.na(averageRating)& !is.na(startYear)] %>% distinct(tconst, .keep_all = TRUE)

write_tsv(analysis_data, "tmp/analysis_data.tsv")

# Step 6: Remove extreme outliers for runtime
  # Analysing the date through a plot
library(ggplot2)

ggplot(analysis_data, aes(y = runtimeMinutes)) +
  geom_boxplot(fill = "blue", outlier.color = "red", outlier.shape = 16) +
  labs(
    y = "Runtime (minutes)",
    title = "Boxplot of Movie and TV Episode Runtime with Outliers Highlighted"
  ) +
  theme_minimal()

# create gen folder for analysis_data_clean
dir.create("gen", recursive = TRUE, showWarnings = FALSE)

  # Function to remove extreme outliers by group
analysis_data_clean <- analysis_data %>%
  group_by(is_tvepisode) %>%
  filter({
    Q1 <- quantile(runtimeMinutes, 0.25)
    Q3 <- quantile(runtimeMinutes, 0.75)
    IQR_val <- Q3 - Q1
    runtimeMinutes >= (Q1 - 1.5 * IQR_val) & runtimeMinutes <= (Q3 + 1.5 * IQR_val)
  }) %>%
  ungroup()

ggplot(analysis_data_clean, aes(y = runtimeMinutes)) +
  geom_boxplot(fill = "green") +
  labs(
    y = "Runtime (minutes)",
    title = "Boxplot of Movie and TV Episode Runtime (Outliers Removed)"
  ) +
  theme_minimal()

# Step 7: Check the cleaned data
dim(analysis_data_clean)

analysis_data_clean %>%
  group_by(is_tvepisode) %>%
  group_split() %>%
  lapply(function(df) {
    summary(df$runtimeMinutes)
  })


summary(analysis_data_clean$averageRating)

# Plot after removing outliers per group
ggplot(analysis_data_clean, aes(x = factor(is_tvepisode, labels = c("Movie", "TV Episode")),
                                y = runtimeMinutes,
                                fill = factor(is_tvepisode, labels = c("Movie", "TV Episode")))) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16) +
  labs(
    x = "Type",
    y = "Runtime (minutes)",
    fill = "Type",
    title = "Runtime Distribution by Type (Outliers Removed)"
  ) +
  theme_minimal()


table(analysis_data_clean$is_tvepisode)

# Step 8: Remove extreme outliers for runtime TVepisodes

  # Analysing the data through a plot

analysis_data_clean %>%
  filter(is_tvepisode == 1) %>%
  ggplot(aes(x = runtimeMinutes)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Runtime for TV Episodes",
       x = "Runtime (minutes)",
       y = "Count")

analysis_data_clean %>%
  filter(runtimeMinutes < 15, is_tvepisode==1) %>%
  summarise(count = n())

  # Removing TV episodes that are shorter than 15 minutes or longer than 65 minutes

analysis_data_clean <- analysis_data_clean %>%
  filter(is_tvepisode != 1 | (runtimeMinutes >= 15 & runtimeMinutes <= 65))

# save in gen
write_tsv(analysis_data_clean, "gen/analysis_data_clean.tsv")
