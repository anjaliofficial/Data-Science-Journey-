#We will work with an example dataset which contains all the 336776 flights that departed from New York City in 2013.

install.packages("nycflights13")    # run only once 

library(tidyverse) 
library(nycflights13) 
dim(flights) 
flights 


#2. Extracting columns (variables) 
names(flights) 
select(flights, year, month, day) 
select(flights, year:day) 
select(flights, -year) 
select(flights, -(year:day))

select(flights, starts_with("sched")) 
select(flights, ends_with("delay")) 
select(flights, contains("arr")) 
select(flights, matches(".*_.*_.*"))    
# regular expression matching 
select(flights, last_col())


#(2) Once particular columns have been extracted, it may be useful to remove duplicate rows.

dim(flights) 
dim(distinct(flights)) 
distinct(select(flights, month, day)) 
distinct(flights, month, day)    
# does the same as line above 

#3) Using select() to extract columns (variables) from a tibble always returns a new tibble.  
#But sometimes we wish to extract a column of data as a vector. 
sat = pull(flights,sched_arr_time) 
sat 
summary(sat)



#(4) You can also change the name of a column. 
rename(flights, destination=dest, tail_num=tailnum)



#3. Adding new columns (variables) 

mutate(flights, gain=arr_delay-dep_delay, speed=distance/(air_time/60)) 


transmute(flights, gain=arr_delay-dep_delay, gain_per_hour=gain /(air_time/60)) 
transmute(flights, distance_residual=distance-mean(distance)) 


#4. Extracting Rows (cases) 
#(1) We can select particular rows by row number. 
slice(flights, 87:96)   # particular 10 rows 
top_n(flights, 20)

#(3) Often we select rows according to some condition which involves the values in some 
#of the columns (variables).  
filter(flights, month==1, day==1)

#(4) It is also possible to take a random sample of rows.  It is good practice (debugging, 
#scientific repeatability) to set the seed for the random number generator.
set.seed(123) 
sample_n(flights, 20) 
0.001*nrow(flights)  # how many rows expected if 0.1% of the rows 
sample_frac(flights, 0.001)

arrange(flights, year, month, day) 
arrange(flights, desc(arr_delay)) # descending order

#Summary 
#In this minilab, we have looked at slicing and dicing a dataset using the tidyverse R package 
#dplyr.  The main functions that we have seen so far are: 
 #  select() to select columns in different ways 
# mutate() to create new columns 
# filter() to select rows by some criterion 
# arrange() to sort the rows
