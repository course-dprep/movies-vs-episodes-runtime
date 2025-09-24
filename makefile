<<<<<<< HEAD
all: data/ratings_raw.tsv data/title_basics_raw.tsv tmp/filtered_movies_TVepisodes.tsv tmp/merged_data.tsv tmp/analysis_data.tsv gen/analysis_data_clean.tsv

# 1: Download raw data from URLs
data/ratings_raw.tsv data/title_basics_raw.tsv: src/data-preparation/download-data.R
	Rscript src/data-preparation/download-data.R

# 2: Clean data 1/2: filter, merge, add dummy variable
tmp/filtered_movies_TVepisodes.tsv tmp/merged_data.tsv:src/data-preparation/data-cleaning.R
	Rscript src/data-preparation/data-cleaning.R
	
# 3: Clean data 2/2: keep relevant columns, handle missing values, visualisation, remove outliers
tmp/analysis_data.tsv gen/analysis_data_clean.tsv: src/data-preparation/final-clean.R
	Rscript src/data-preparation/final-clean.R
