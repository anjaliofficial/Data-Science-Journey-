library(tidyverse)

# Load data
url = "https://raw.githubusercontent.com/fivethirtyeight/data/master/unisex-names/unisex_names_table.csv"
namesdata = read_csv(url)

# Get top 10 most unisex names
top10 =  namesdata %>% arrange(gap) %>% slice(1:10)

# Create a simple bar plot using ggplot2
ggplot(top10, aes(x = reorder(name, gap), y = gap)) +
  geom_col(fill = "skyblue") +
  labs(title = "Top 10 Most Unisex Names",
       x = "Name",
       y = "Gap") 


# for all data...... bar chart 
ggplot(namesdata, aes(x = name, y = gap))+
  geom_bar(stat = "identity")