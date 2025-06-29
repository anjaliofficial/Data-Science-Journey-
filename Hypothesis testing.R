
#1. Regression Models with Two Quantitative Predictor Variables 
#install.packages("ISLR")    
# run only once 
library(tidyverse) 
library(ISLR) 
credit = as_tibble(Credit) 
credit = select(credit,Balance,Limit,Income) 
summary(credit)