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
  geom_point(alpha=0.7) # standard protocols in R 0.7 nai rakha bhanchhaa

# Nested function calls 
ggplot(select(filter(gapminder, continent=="Europe", year==2007), 
              -continent,-year),aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.5) 

Pipes 
gapminder %>% 
  filter(continent=="Europe", year==2007) %>% 
  select(-continent,-year) %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.5) 
