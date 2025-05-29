library(tidyverse)
library(nycflights13)
# Extracting Rows

rename(flights, destination=dest, tail_num=tailnum) 
View(flights)
dim(flights)



# -------------------Add new columns (variables)
# Mutate le new column add garchha ra agadi ko kunai column ko data lina parchha 
#Adds new columns or modifies existing ones.
#Keeps all original columns in the output.



flights = mutate(flights, gain=arr_delay - dep_delay, speed=distance/(air_time/60)) 
# jun data set ho tei name ko variable banauna parchha
View(flights)

dim(flights)


#Transmute  le only new add gareko  columns matra dekhauchha baki sabai hide hunchha 
# yo data analysis ma data loss na hos bhanera use hunchha, new data set banayera- according to related data
#naya data set banaunchha - simple ]
transmute(flights, gain=arr_delay-dep_delay, gain_per_hour=gain /(air_time/60)) 
transmute(flights, distance_residual=distance-mean(distance))


#4. Extracting Rows (cases) 
head(flights, 20)
slice(flights, 87:96) # particular 10 rows dinchha 
top_n(flights, 20)  # yelsee column wise top value dinchha 

# Filter 
filter(flights, month==1, day ==11 )

# sample distribution in R 
#Set.seed le sets the random number generator seed. this makees any random process reproducable 
# 
set.seed (123) # harek choti run gardaa kheri same output aoos bhanera yo use garchha random reproducible use gardaa
# machine learing ma tarining data sadhai eutai hos bhanera yo use garchha  haina bhane Harek choti different otpt aunchha 


sample_n(flights, 20 ) # sample 20 ota data deko hoeach time run garda different different otput dinchha 
0.090*nrow(flights) # how many rows  expected if 0.1% of the rows
# % wise pani hamile data set nikalna milchha 

sample_frac(flights, 0.001)  # or use can also do it 


# Arrange data 
arrange(flights, year, month, day)  # default ma assending order ma dinchha 
arrange(flights, desc(arr_delay)) # descending order 


arrange(flights, desc(dep_time)) # descending order 

# Exercise 

#(a) Departed between midnight and 6am (inclusive). 

 filter (flights, dep_time == 2400 | dep_time<= 600)

# Arrival delay of 2 or more hours 
X = filter (flights, arr_delay >= 120)
View(X)

#(c) Flew to Houston (IAH or HOU). 

flew_houston = filter(flights, dest == 'IAH' | dest == 'HOU')
view(flew_houston)


#(d) Were operated by United (UA), American (AA), or Delta (DL). 

airlines_details = filter(flights, carrier == 'UA' | carrier == 'AA' | carrier =='DL' )
view(airlines_details)


#(e) Arrived more than two hours late, but didn’t leave late. 

late = filter(flights, arr_delay>120, dep_delay <=0)
View(late)

#(f) Were delayed by at least an hour, but made up over 30 minutes in flight 

z = filter(flights, dep_delay >= 60, dep_delay - arr_delay >30)
view(z)

View(flights)

# find all filights 
#a. had a departure delay  more than 1 hour 
x = filter(flights, dep_delay>60)
View(x)

#b. left on time 

a = filter(flights, dep_delay > 0)

#c. arrived early
b = filter(flights, arr_delay<0)
#d. had both departures and arrival dealy greater than 30 min 

c = filter(flights)


# create a new column gain (depdelay- arr delay then :- 
#filter all the flights with positive gain 
#filter all the flights with nagative2 gain 
#find the top 10 flights that gained most time in air 
top_n(flights, 10, coverd = gain)

# find the flights that flew in the summer months  (june, july august, september) 
