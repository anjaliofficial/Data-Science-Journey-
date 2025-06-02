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
