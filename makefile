all: data-preparation analysis gen/output/data-exploration.html gen/output/deployment.html

data-preparation:
	make -C src/data-preparation
	
analysis:
	make -C src/analysis 
	
gen/output/data-exploration.html: src/data-exploration/data-exploration.Rmd
	Rscript src/data-exploration/render-data-exploration.R

gen/output/deployment.html: src/deployment/deployment.Rmd
	Rscript src/deployment/render-deployment.R

clean:
	R -e "unlink('gen/tmp/*', recursive = TRUE)"
	R -e "unlink('gen/output/*', recursive = TRUE)"