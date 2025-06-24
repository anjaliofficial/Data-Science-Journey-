library(tidyverse) 
library(ISLR)    
# you might also need install.packages("ISLR") 
credit = as_tibble(Credit) 
ggplot(credit, aes(x=Income,y=Balance)) + 
  geom_point() 

ggplot(credit) + 
  geom_point(aes(x=Income,y=Balance,colour=Student)) + 
  scale_colour_discrete() + 
  labs(title="Balance vs Income ", 
       x = "Income ($000)", 
       y = "Balance ($)") 


#descrite - in categorical data 

ggplot(credit) + 
  geom_point(aes(x=Income,y=Balance)) + 
  scale_x_continuous(limits=c(-100,250)) 


#bIULDING Ddifferent types of plots 


d = ggplot(mpg, aes(fl)) 
d = d + geom_bar() 
d = d + coord_flip() 
d




library(ggplot2)
library(gapminder)


# Histogram 


ggplot(gapminder, aes(x = lifeExp)) +
  geom_histogram(binwidth = 6, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Life Expectancy",
       x = "Life Expectancy",
       y = "Count")


#Box plot
ggplot(gapminder, aes(x = continent, y = lifeExp)) +
  geom_boxplot(fill = "orange", color = "black") +
  labs(title = "Life Expectancy by Continent",
       x = "Life Expectancy",
       y = "Continent")



ggplot(gapminder, aes(x = continent, fill = as.factor(year))) +
  geom_bar(position = "dodge") +
  labs(title = "Number of Records per Continent by Year",
       x = "Continent",
       y = "Count",
       fill = "Year")
