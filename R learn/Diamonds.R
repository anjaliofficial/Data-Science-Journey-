library(tidyverse)
View(diamonds)

#(a) Write a dplyr pipe that produces a summary table showing for each cut of diamond 
#the number of diamonds of that cut and the correlation coefficient of carat and price.

summary(diamonds)
diamonds %>% 
  group_by(cut) %>% 
  summarise(n = n (),
            correlation = cor(carat, price))

# diamond grades 
# color categoery 

dim(diamonds)
 
#cor  function - for corelation find 

#(b) Write a dplyr pipe to determine what color of diamond has the highest mean of price 
#per carat among diamonds with Ideal cut.
# Load necessary libraries
library(dplyr)
library(ggplot2)  # for diamonds dataset

# Pipe solution
diamonds %>%
  filter(cut == "Ideal") %>%
  mutate(price_per_carat = price / carat) %>%
  group_by(color) %>%
  summarise(mean_price_per_carat = mean(price_per_carat, na.rm = TRUE)) %>%
  arrange(desc(mean_price_per_carat)) %>%
  slice(1)

