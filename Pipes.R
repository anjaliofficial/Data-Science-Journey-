library(tidyverse) 
# run only once 
library(gapminder) 
names(gapminder) 

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(aes(colour=continent)) 
 
library(tidyverse) 
# run only once 
library(gapminder) 
names(gapminder) 

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(aes(colour=continent)) +
  scale_x_log10()

options(scipen = 1000)

# Intermediate variables 
A = filter(gapminder, continent=="Europe", year==2007) 
B = select(A,-continent,-year) 
ggplot(B,aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.5)