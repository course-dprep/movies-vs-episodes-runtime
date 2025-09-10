---
title: "README"
output: pdf_document
date: "2025-09-03"
---
# How does runtime influence audience ratings for movies compared to TV episodes, controlling for the release year?

## Introduction

## Research Motivation and Research Question
Audience ratings are a key determinant of a title's ability to attract viewers (Austin, 1980) and have been shown to influence performance measures such as box office revenues (Moon et al., 2010). While many factors affect ratings, runtime is an especially relevant but underexplored dimension. Prior research indicates that episode length can significantly shape viewer ratings (Danaher et al., 2011). However, limited work has addressed whether similar effects exist for movies, or whether its impact differs between these two formats. This study addresses this gap by examining the research question: how does runtime influence audience ratings for movies compared to TV episodes, controlling for the release year?
	This research question is both relevant and practical. Runtime is a central aspect of the viewing experience: very short films might feel underdeveloped for the audience, while extremely long ones may lead to a higher amount of fatigue. Audience expectations, however, are dynamic: they change over time along with production trends and rating practices. By controlling for release year, this study can separate these time-related factors from the effect of runtime itself, offering clearer insights into how length relates to ratings across different formats. Such insights can also support streaming platforms, like Netflix, and production studios in tailoring runtimes to maximize audience satisfaction across content types.

## Research Method
To answer the research question, a multiple regression analysis will be conducted. The regression analysis is choses because it can incorporate covariates and it provides formal significance tests. Furthermore, this approach is appropiate because it estimates the independent effect of runtime on ratings while controlling for release year and content type (movies vs. TV episodes). An interaction term between runtime and content type will be included to test whether the effect of runtime differs between movies and TV episodes, which directly addresses the research question. The model not only measures the strength and direction of these relationships, but also tests their statistical significance. 
	Model assumptions such as linearity and homoscedasticity will be checked. If necessary, modifications will be made to ensure robust results. If needed, additional exploratory analyses will be conducted, for example by grouping release years into broader periods or by checking non-linear patterns, to make sure the results are reliable.
	To perform the regression analysis, the following data sets with the required variables will be used, acquired from IMDb on September 1st 2025:
title.basics.tsv for movie duration and release year
title.ratings.tsv for movie rating

## Way of Deployment
The results will be communicated through an RMarkdown-generated PDF report. This format integrates text, statistical output, tables, and visualizations into a structured document. The PDF is platform-independent, ensuring that results are easily accessible and interpretable across devices. This approach enhances clarity for a broad audience, from academic readers to practitioners interested in data-driven insights into film evaluation. 

## Workflow
Finally, the following steps in the workflow contribute to reproducibility and reusability:
  1. Data exploration
  2. Data preparation
  3. Regression analysis and results
  4. Evaluation and deployment

To ensure replicability, the workflow will be automated using RMarkdown and controlled with a Makefile. This enables the entire analysis to be rerun end-to-end with limited manual work. Such a framework not only improves the reliability of this study, but also provides a reusable resource for students and researchers who wish to replicate the analysis with different datasets or apply it to similar research questions. This way, this study will both contribute to insights into the relationship between movie duration and movie ratings and to the broader research and educational community.

## Results

## Reference List
Austin, B. A. (1980). Rating the movies. _Journal of Popular Film and Television_, _7_(4), 384–399. https://doi.org/10.1080/01956051.1980.9943897 

Danaher, P. J., Dagger, T. S., & Smith, M. S. (2011). Forecasting television ratings. _International Journal of Forecasting_, _27_(4), 1215–1240. 
https://doi.org/10.1016/j.ijforecast.2010.08.002   

Moon, S., Bergey, P. K., & Iacobucci, D. (2010). Dynamic Effects among Movie Ratings, Movie Revenues, and Viewer Satisfaction. _Journal of Marketing_, _74_(1), 108-121. https://doi.org/10.1509/jmkg.74.1.108 

## Contributors
This repository is part of a project for the course Data Prep. Programming Skills instructed by Roshini Sudhaharan. The project was created by:
- [Martijn van Eijl](https://github.com/mvaneijl) | M.D.vanEijl@tilburguniversity.edu
- [Babette Janssen Lok](https://github.com/Babettejanssenlok) | B.JanssenLok@tilburguniversity.edu
- [Wendy Li](https://github.com/wendyliuvt) | W.Y.Q.Li@tilburguniversity.edu
- [Anouk van der Steen](https://github.com/anoukvandersteen) | A.vdrSteen@tilburguniversity.edu
- [Koen van de Wetering](https://github.com/x) | K.vdWetering@tilburguniversity.edu
- [Femke de Wilde](https://github.com/Femke-de-Wilde) | F.D.deWilde@tilburguniversity.edu
