
#Model Diagnostics

library(tidyverse) 
install.packages('datarium')
data("marketing", package="datarium") 
marketing = as_tibble(marketing) 
view(marketing)


# Model is sales = a + b*youtube 
model = lm(sales~youtube, data=marketing) 
summary(model) 


library(broom)
fitted = augment(model) 


ggplot(fitted, aes(x=.fitted,y=.resid)) + 
  geom_point() + 
  geom_hline(yintercept=0)


library(ggfortify) 
model = lm(sales~youtube,data=marketing) 
autoplot(model)


model = lm(sales~youtube+facebook,data=marketing) 
autoplot(model)

ggplot(fitted, aes(x=.fitted,y=.resid)) + 
  geom_point() + 
  geom_hline(yintercept=0)

