# 📦 Load Required Libraries
library(tidyverse)    # Includes dplyr, ggplot2, tidyr for data wrangling and visualization
library(rvest)        # Web scraping: HTML reading and parsing
library(stringr)      # String operations and regular expressions
library(lubridate)    # Date/time handling
library(tidyr)        # Data reshaping functions like separate(), unite(), etc.

# -----------------------------
# 🏈 PART 1: SUPER BOWL WINNERS
# -----------------------------

# 🌐 Step 1: Read the Webpage
url = "http://espn.go.com/nfl/superbowl/history/winners"
page = read_html(url)  # Load the HTML content of the page

# 📋 Step 2: Extract Tables from the Page
sb_table = html_nodes(page, 'table')        # Get all table nodes
sb = html_table(sb_table)[[1]]              # Extract the first table (Super Bowl results)

# 🧹 Step 3: Clean and Rename Columns
sb = sb[c(-1, -2), ]                         # Remove unwanted header rows
names(sb) = c("number", "date", "site", "result")  # Rename columns
sb = as_tibble(sb)                           # Convert to tibble for better printing

# 🛠 Step 4: Data Processing
pattern = ' \\d+$'                           # Regex pattern to extract last number (score)

sb_cleaned = sb %>%
  mutate(number = 1:nrow(sb)) %>%            # Add Super Bowl number (index)
  mutate(date = mdy(date)) %>%               # Convert string to Date format
  separate(site, c("stadium", "city", NA), sep = '[()]') %>%  # Split site into stadium and city
  separate(result, c("winner", "loser"), sep = ', ') %>%       # Separate result into winner and loser
  mutate(winnerscore = as.numeric(str_extract(winner, pattern)),  # Extract winner's score
         looserscore = as.numeric(str_extract(loser, pattern)),   # Extract loser's score
         winner = gsub(pattern, "", winner),                      # Remove score from winner name
         margin = winnerscore - looserscore)                      # Calculate winning margin

# 📊 Step 5: Visualization of Winning Margin by Year
ggplot(sb_cleaned, aes(x = factor(year(date)), y = margin)) + 
  geom_boxplot(fill = "lightblue") +
  labs(
    title = "Winning Margin Over Years",
    x = "Year",
    y = "Winning Margin"
  )

# -----------------------------
# 🎬 PART 2: FASTEST-GROSSING FILMS
# -----------------------------

# 🌐 Step 1: Read Wikipedia Page
url = "https://en.wikipedia.org/wiki/List_of_fastest-grossing_films"
page = read_html(url)

# 📋 Step 2: Extract Tables
atable = html_nodes(page, 'table')
length(atable)  # Check how many tables are on the page

# 🧾 Step 3: Extract Desired Table
a = html_table(atable)[[2]]  # Choose the second table; use [[1]] if second fails
colnames(a)                  # View column names

# 🛠 Step 4: Clean the Date Column
a_cleaned = a %>%
  separate(Date, into = c("Date", "number"), sep = "\\[|\\]", remove = FALSE) %>% 
  mutate(Date = mdy(Date))   # Convert to proper date format

# 👁️ Step 5: View the Cleaned Data
View(a_cleaned)  # Opens cleaned data in RStudio viewer
