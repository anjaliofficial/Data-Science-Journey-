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


