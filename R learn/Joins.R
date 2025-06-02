install.packages('nycflights13')
library(nycflights13)
View(airlines) 
data(package= "nycflights13")
View(flights)

#Which airline has the highest number of delayed departures?

delayed_flights = flights %>%       
  # start with the flights 
  filter(dep_delay>0) %>%           
  # find only the delays 
  group_by(carrier) %>%             
  # group by airline (carrier) 
  summarise(num_delay=n())          
# count the observations 
delayed_flights


left_join(delayed_flights,airlines,by="carrier") 

#It is possible to complete the whole sequence as one dplyr pipe. 
flights %>%                             # start with the flights 
  filter(dep_delay>0) %>%               # find only the delays 
  group_by(carrier) %>%                 # group by airline (carrier) 
  summarise(num_delay=n()) %>%          # count the observations 
  left_join(airlines,by="carrier") %>%  # join by common key 
  filter(num_delay==max(num_delay)) %>%  # find most delayed 
  select(name)   # select the airline 

View(flights)
view(airports)

#Challenge 2.  On average, to which airport do flights arrive most early? 
flights %>% 
  group_by(dest) %>% 
summarise(mean_delay = mean (arr_delay))

# Another way null value na bhako rm bbhaneko remove na bhaneko not available 
flights %>% 
  group_by(dest) %>% 
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE))

flights %>% 
  group_by(dest) %>% 
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE)) %>% 
  filter(mean_delay == min(mean_delay, na.rm = TRUE))

# we dont know thw airline name soo hamile tyo find garn paryo 
flights %>% 
  group_by(dest) %>% 
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE)) %>% 
  filter(mean_delay==min(mean_delay, na.rm=TRUE)) %>% 
  left_join(airports,by=c("dest"="faa")) 


#Finally we just want the full name of the airport. 

flights %>% 
  group_by(dest) %>% 
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE)) %>% 
  filter(mean_delay==min(mean_delay, na.rm=TRUE)) %>% 
  left_join(airports,by=c("dest"="faa")) %>% 
  select(name) 





#Exercise.  Use the nycflights13 package datasets to answer the following. 
#(a) Considering only flights from JFK to SEA, what was the average, min, and max air 
#time of those flights? 
  

library(dplyr)
library(nycflights13)

jfk_to_sea <- flights %>%
  filter(origin == "JFK", dest == "SEA") %>%
  summarise(
    average_air_time = mean(air_time, na.rm = TRUE),
    min_air_time = min(air_time, na.rm = TRUE),
    max_air_time = max(air_time, na.rm = TRUE)
  )

print(jfk_to_sea)
  
#(b) Which city was flown to with the highest average speed? 

library(nycflights13)
library(tidverse)
View(airports)

flights %>% 
  mutate(speed_mph = distance / (air_time / 60)) %>% 
  group_by(dest) %>% 
  summarise(avg_speed = mean (speed_mph, na.rm = TRUE)) %>% 
  top_n(1, avg_speed) %>% 
  left_join(airports, by = c("dest" = "faa")) %>% 
  select(dest, name, avg_speed, tzone)

  