# This makefile will be used to automate the
# different steps in your project.

all: data/title_basics_raw.tsv data/ratings_raw.tsv tmp/filtered_movies_TVepisodes.tsv tmp/merged_data.tsv tmp/analysis_dataset gen/analysis_dataset_clean

# download raw data from URLs
data/title_basics_raw.tsv data/ratings_raw.tsv: src/data-preparation/download-data.R
	Rscript src/data-preparation/download-data.R

# data cleaning1/2: filter & merge datasets
tmp/filtered_movies_TVepisodes.tsv tmp/merged_data.tsv: src/data-preparation/data-cleaning.R
	Rscript src/data-preparation/data-cleaning.R
	
# data cleaning2/2: analysis_dataset: Select relevant columns, remove missing values, de-duplicate
tmp/analysis_dataset gen/analysis_dataset_clean: src/data-preparation/final-clean.R
	Rscript src/data-preparation/final-clean.R


