library(tidyverse)

data1 <- data.frame(ID = 1:2,                      # Create first example data frame
                    X1 = c("a1", "a2"),
                    stringsAsFactors = FALSE)
data2 <- data.frame(ID = 2:3,                      # Create second example data frame
                    X2 = c("b1", "b2"),
                    stringsAsFactors = FALSE)
 
data1 
data2
# join concept wihtout using dplyr or tidy verse
 
merge(x,y,by.x, all,all.x, all.y) # x jaile pani left ma join garirako data hunchha bhane y bhaneko right side ko join hunchha 
# where x , y = data frame to be merged 
#by = common column(s) names to match 
# by.x and by.y sepicies different column names if the keys differ ]
# all : logical if True. performs a full (outer ) join 
#all.x : loc=gical if true, performs a right join 

# Types of JOIN in R 
# Inner join (default join in R )

merge(data1, data2, by= "ID")

#left join 
merge ( data1, data2, by = "ID", all.x = TRUE)
merge ( data1, data2, by = "ID", all.y = TRUE) 

#right join m
merge (data1, data2, all.y = TRUE)

#Outer Join 
merge(data1, data2 , all = TRUE)

library(tidyverse)
library(dplyr)

