# importing data using csv file 

library(tidyverse)
sportsdata = read.csv("C:\\Users\\bista\\OneDrive\\Desktop\\Data-Science-Journey-\\Sportcarprice.csv")
sportsdata

view(sportsdata)

ggplot(sportsdata, aes(x = Car.Make ))+
  geom_bar(fill = "purple")+
  labs(title = "Numbers of cars make by make and model ",  x = "Make and model", y = "Count")+
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 60, hjust= 1))
# Check the structure of your data to understand the types of columns
str(sportsdata)

# Convert 'Car.Make' and 'year' columns to factors if they're not already
sportsdata$`Car.Make` <- factor(sportsdata$`Car.Make`)
sportsdata$year <- factor(sportsdata$year)

# Check the summary of 'Car.Make' and 'year' columns to ensure they are correctly formatted
summary(sportsdata$`Car.Make`)
summary(sportsdata$year)

# Plotting the bar chart showing the number of cars per car make for each year
ggplot(sportsdata, aes(x = `Car.Make`, fill = factor(year))) +
  geom_bar(position = "dodge") +  # Bar chart with dodge position
  labs(title = "Number of cars per make by year", x = "Car Make", y = "Count") +  # Adding title and labels
  scale_fill_brewer(palette = "Set3", name = "Year") +  # Color palette for years
  theme_minimal() +  # Minimal theme for the plot
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotating x-axis text for readability




#2. Importing data from a URL -------------------
library(tidyverse)

url <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/unisex-names/aging_curve.csv"
namesdata <- read_csv(url)

# Calculate gap between male and female percentages
namesdata <- namesdata %>%
  mutate(gap = abs(male_perct - female_perct))

# View data with names sorted by smallest gender gap
View(arrange(namesdata, gap))
