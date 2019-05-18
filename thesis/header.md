---
author: 'Peder G. Landsverk'
date: 'May 2019'
title: 'Text Classification for Event Coding'

csl: refstyle.csl

bibliography: lib.bib

output: 
   reedtemplates::reed_thesis:
      toc: true 
      toc_depth: 2
header-includes:
   - \setlength{\parindent}{0em}
   - \setlength{\parskip}{1em}

---



```{R, include = FALSE, echo = FALSE}
knitr::opts_chunk$set(include = FALSE, echo = FALSE)
options(xtable.comment = FALSE)
```


```{R}

library(xtable)
library(magrittr)
library(tibble)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(tidytext)
```
