library(tidyverse)
library(rvest) # used for werb scrappping. it is used to read and parse html from web pages
library(stringr) # it is the packages for string manipulation. it provides consistant functions for pattern matching and regular expression.

library(tidyr) # reshapes and cleans the data. it `helps you to move columns into rows , it can be either seperate or  combined columns 
library(lubridate) # iut is the package for working with dates and time. it makes it  easy to convert strings into dates, calculate the differences between dates and extact the datye pattern such as week days, leap years, etc. 

 url= "http://espn.go.com/nfl/superbowl/history/winners"
 page = read_html(url)
 page 
 
 sb_table = html_nodes(page, 'table') 
 sb = html_table(sb_table)[[1]]
 sb 
 
 sb = sb[c(-1,-2), ]
 names(sb) = c("number","date", "site", "result")
 sb = as_tibble(sb)
 sb
 
 mutate(sb, number=1:nrow(sb))
 mutate(sb, date = mdy(date))
 
 separate(sb,site,c("stadium", "city", NA), sep = '[()]')
 separate(sb, result ,c ("winner", "loser"), sep = ',')
 
 pattern = ' \\d+$'
 separate (sb, result,c("winner", "loser"),sep = ', ' ) %>% 
   mutate(winnerscore = as.numeric(str_extract(winner, pattern))) %>% 
   mutate(winner = gsub(pattern , "", winner))
 
 
 