all: ../../gen/tmp/analysis_data_clean.tsv

#1 Download raw data
../../raw/ratings_raw.tsv ../../raw/title_basics_raw.tsv: download-data.R
	Rscript download-data.R

#2 Filter
../../gen/tmp/filtered_movies_TVepisodes.tsv: data-cleaning.R ../../raw/title_basics_raw.tsv
	Rscript data-cleaning.R

#3 Merge
../../gen/tmp/merged_data.tsv: merge-data.R ../../gen/tmp/filtered_movies_TVepisodes.tsv ../../raw/ratings_raw.tsv
	Rscript merge-data.R

#4 Final clean
../../gen/tmp/analysis_data.tsv ../../gen/tmp/analysis_data_clean.tsv: final-clean.R ../../gen/tmp/merged_data.tsv
	Rscript final-clean.R
