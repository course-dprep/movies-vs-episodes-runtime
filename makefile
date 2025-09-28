all: gen/analysis_data_clean.tsv

# 1: Download raw data
raw/ratings_raw.tsv raw/title_basics_raw.tsv: src/data-preparation/download-data.R
	Rscript src/data-preparation/download-data.R

# 2: Filter
tmp/filtered_movies_TVepisodes.tsv: src/data-preparation/data-cleaning.R raw/title_basics_raw.tsv
	Rscript src/data-preparation/data-cleaning.R

# 3: Merge
tmp/merged_data.tsv: src/data-preparation/merge-data.R tmp/filtered_movies_TVepisodes.tsv raw/ratings_raw.tsv
	Rscript src/data-preparation/merge-data.R

# 4: Final clean
tmp/analysis_data.tsv gen/analysis_data_clean.tsv: src/data-preparation/final-clean.R tmp/merged_data.tsv
	Rscript src/data-preparation/final-clean.R

#5: Regression analysis
analysis: src/data-preparation/analysis.R gen/analysis_data_clean.tsv
	Rscript src/data-preparation/analysis.R