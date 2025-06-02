library(tidyverse) 
# run only once 
library(gapminder) 
names(gapminder) 

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(aes(colour=continent)) 
 
library(tidyverse) 
# run only once 
library(gapminder) 
names(gapminder) 

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(aes(colour=continent)) +
  scale_x_log10()

options(scipen = 1000)

# Intermediate variables 
A = filter(gapminder, continent=="Europe", year==2007) 
B = select(A,-continent,-year) 
ggplot(B,aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.7) # standard protocols in R 0.7 nai rakha bhanchhaa

# Nested function calls 
ggplot(select(filter(gapminder, continent=="Europe", year==2007), 
              -continent,-year),aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.5) 

Pipes 
gapminder %>% 
  filter(continent=="Europe", year==2007) %>% 
  select(-continent,-year) %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.5) 


gapminder %>% 
  filter(year==1952) %>% 
  summarise(num_countries=n_distinct(country), 
            mean_pop=mean(pop)) 

gapminder %>% 
  group_by(year) %>% 
  summarise(num_countries=n_distinct(country), 
            mean_pop=mean(pop)) 


gapminder %>% 
  group_by(year) %>% 
  summarise(num_countries=n_distinct(country), 
            mean_pop=mean(pop)) %>% 
  ggplot(aes(x=year,y=mean_pop)) + 
  geom_line()

options(scipen=1000)

View(starwars)
names(starwars)

dim(starwars)
ncol(starwars)


starwars %>%
  filter(species == "Droid") %>%
  arrange(desc(mass))

myleague = "E0"
# Get data from www.football-data.co.uk
url = paste0("https://www.football-data.co.uk/example.csv")  
football = read_csv(url)
View(football)

distinct(football,HomeTeam)
names(football)
football %>% 
  filter(HomeTeam=="Arsenal")

football %>%
  group_by(HomeTeam) %>%
  summarise(mean_home_goals = mean(`Full time home goals`, na.rm = TRUE))


