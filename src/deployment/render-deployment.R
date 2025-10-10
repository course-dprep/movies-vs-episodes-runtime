library(rmarkdown)
library(here)

# Ensure output folder exists
dir.create(here("gen/output"), recursive = TRUE, showWarnings = FALSE)

# Render Rmd
render(
  input = here("src/deployment/deployment.Rmd"), 
  output_file = "deployment.html",          
  output_dir = here("gen/output"),
  clean = TRUE
)
