library(rmarkdown)
library(here)

# Ensure output folder exists
dir.create(here("gen/output"), recursive = TRUE)

# Render Rmd
render(
  input = here("src/data-exploration/data-exploration.Rmd"),
  output_file = "data-exploration.html",  
  output_dir = here("gen/output"),
  clean = TRUE
)
