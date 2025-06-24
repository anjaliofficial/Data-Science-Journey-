#Hypothesis testin g
library(tidyverse)
state = as_tibble(state.x77)
summary(state)
ggplot(state, aes(x = Murder))+
  geom-boxplot()