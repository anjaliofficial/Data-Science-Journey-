
#1. Regression Models with Two Quantitative Predictor Variables 
#install.packages("ISLR")    
# run only once 
library(tidyverse) 
library(ISLR) 
credit = as_tibble(Credit) 
credit = select(credit,Balance,Limit,Income) 
summary(credit)

#(2) Let us take a look at the correlation between the variables (take them in pairs). 
#install.packages("GGally")    
# run only once 
library(GGally)
ggscatmat(select(credit,Balance,Limit,Income)) 


#3) Suppose we are interested in predicting credit card balance (Balance) using credit 
#card limit (Limit), i.e., the response variable is Balance and the predictor variable is 
#Limit. 
ggplot(credit, aes(x=Limit,y=Balance)) + 
  geom_point() + 
  geom_smooth(method="lm",se=FALSE) 
model = lm(Balance~Limit, data=credit) 
summary(model) 
model$coefficients


#Stii not working

