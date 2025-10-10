---
title: "README"
output: pdf_document
date: "2025-10-08"
---

# How does runtime influence audience ratings for movies compared to TV episodes, controlling for the release year?

# Introduction

This project investigates how the runtime of movies and TV episodes affects audience ratings while controlling for release year. The analysis provides insights for content producers and streaming platforms to optimize runtimes for audience satisfaction.

# Research Motivation and Research Question

Audience ratings are a key determinant of a title's ability to attract viewers (Austin, 1980) and have been shown to influence performance measures such as box office revenues (Moon et al., 2010). While many factors affect ratings, runtime is an especially relevant but underexplored dimension. Prior research indicates that episode length can significantly shape viewer ratings (Danaher et al., 2011). However, limited work has addressed whether similar effects exist for movies, or whether its impact differs between these two formats. This study addresses this gap by examining the research question:

**How does runtime influence audience ratings for movies compared to TV episodes, controlling for the release year?**

This research question is both relevant and practical. Runtime is a central aspect of the viewing experience: very short films might feel underdeveloped for the audience, while extremely long ones may lead to higher fatigue. Audience expectations, however, are dynamic: they change over time along with production trends and rating practices. By controlling for release year, this study separates these time-related factors from the effect of runtime itself, offering clearer insights into how length relates to ratings across different formats. Such insights can also support streaming platforms, like Netflix, and production studios in tailoring runtimes to maximize audience satisfaction across content types.

# Research Method

To answer the research question, a multiple regression analysis was conducted. This approach estimates the independent effect of runtime on ratings while controlling for release year and content type (movies vs. TV episodes). An interaction term between runtime and content type tests whether the effect of runtime differs between movies and TV episodes. Model assumptions such as linearity and homoscedasticity are checked, and exploratory analyses may be conducted to ensure robust results.

The following datasets, acquired from IMDb on September 1st 2025, were used:

-   `title.basics.tsv` – movie and TV episode duration and release year
-   `title.ratings.tsv` – movie and TV episode ratings

# Way of Deployment

The results are communicated through an **RMarkdown-generated PDF report**. This format integrates text, statistical output, tables, and visualizations into a structured document. The PDF is platform-independent, ensuring that results are easily accessible and interpretable across devices. This approach enhances clarity for a broad audience, from academic readers to practitioners interested in data-driven insights into film evaluation.

# Repository Structure

```         
main/
│
├── Data_exploration/
│ ├── Data_exploration.Rmd
│ └── Data_exploration.pdf
│
├── reporting/
│ └── report.Rmd
│
├── src/
│ ├── analysis/
│ │ └── analysis.R
│ ├── data-preparation/
│ │ ├── download-data.R
│ │ ├── data-cleaning.R
│ │ ├── merge-data.R
│ │ └── final-clean.R
│ └── start_app.R
│
├── makefile
├── README.Rmd
├── RMarkdown.Rmd
├── RMarkdown.pdf
├── Rplots.pdf
└── team-project-team3.Rproj
```

# Workflow

The workflow ensures reproducibility and reusability:

1.  **Data Exploration** – Summarize dataset structure, check missing values, detect outliers.
2.  **Data Preparation** – Filter, merge, clean, and remove extreme outliers.
3.  **Regression Analysis** – Fit multiple regression with interaction term.
4.  **Evaluation and Deployment** – Generate PDF reports and plots.

To ensure replicability, the workflow is automated using **RMarkdown** and controlled with a **Makefile**. This enables the entire analysis to be rerun end-to-end with limited manual work. Such a framework not only improves the reliability of this study, but also provides a reusable resource for students and researchers who wish to replicate the analysis with different datasets or apply it to similar research questions.

**Key findings:**

-   Runtime positively influences audience ratings for both movies and TV episodes.
-   The effect is stronger for movies than for TV episodes.
-   Very short or excessively long TV episodes were removed to reduce bias (15–65 min retained).
-   Release year has a small negative effect on ratings.

**Practical implications:**

-   Longer movies are likely to receive higher audience ratings.
-   For TV episodes, additional runtime slightly increases ratings, but with diminishing returns.
-   Streaming platforms and producers can use these insights to optimize runtime for audience engagement.

# Running the Project

1.  Clone the repository and set the correct working directory:

```         
<https://github.com/%7Byour-username%7D/imdb-runtime-analysis.git> 
cd movies-vs-episodes-runtime
```

2.  Run the full workflow with Make:

```         
make
```

# Dependencies

**R Packages:**

```         
r install.packages(c("tidyverse", "data.table", "ggplot2", "readr"))
```

## Other dependencies

-   Make
-   R \>= 4.3

## Results

Cleaned dataset, PDFs, and reports can be checked:

-   **Cleaned dataset:** `gen/analysis_data_clean.tsv`
-   **Data exploration PDF:** `Data_exploration/Data_exploration.pdf`
-   **Final report PDF:** `RMarkdown.pdf`

## Reference List

-   Austin, B. A. (1980). *Rating the movies.* Journal of Popular Film and Television, 7(4), 384–399. <https://doi.org/10.1080/01956051.1980.9943897>

-   Danaher, P. J., Dagger, T. S., & Smith, M. S. (2011). *Forecasting television ratings.* International Journal of Forecasting, 27(4), 1215–1240. <https://doi.org/10.1016/j.ijforecast.2010.08.002>

-   Moon, S., Bergey, P. K., & Iacobucci, D. (2010). *Dynamic Effects among Movie Ratings, Movie Revenues, and Viewer Satisfaction.* Journal of Marketing, 74(1), 108–121. <https://doi.org/10.1509/jmkg.74.1.108>

## Contributors

This repository is part of a project for the course *Data Prep: Programming Skills* instructed by Roshini Sudhaharan. The project was created by:

- **Martijn van Eijl**  
  GitHub: [mvaneijl](https://github.com/mvaneijl)  
  Email: M.D.vanEijl@tilburguniversity.edu

- **Babette Janssen Lok**  
  GitHub: [Babettejanssenlok](https://github.com/Babettejanssenlok)  
  Email: B.JanssenLok@tilburguniversity.edu

- **Wendy Li**  
  GitHub: [wendyliuvt](https://github.com/wendyliuvt)  
  Email: W.Y.Q.Li@tilburguniversity.edu

- **Anouk van der Steen**  
  GitHub: [anoukvandersteen](https://github.com/anoukvandersteen)  
  Email: A.vdrSteen@tilburguniversity.edu

- **Koen van de Wetering**  
  GitHub: [koenvandewetering](https://github.com/koenvandewetering)  
  Email: K.vdWetering@tilburguniversity.edu

- **Femke de Wilde**  
  GitHub: [Femke-de-Wilde](https://github.com/Femke-de-Wilde)  
  Email: F.D.deWilde@tilburguniversity.edu
