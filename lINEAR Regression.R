library(tidyverse) 
# Anscombe's quartet (first dataset) 
x = anscombe[,1] 
y = anscombe[,5] 
ggplot(NULL,aes(x=x,y=y)) + 
  geom_point() 


a = 2.0 
b = 0.7 
residuals = y-(a+b*x)  #RESIDUAL = ERROR 
residuals 
ggplot(NULL,aes(x=x,y=y)) + 
  geom_point() + 
  geom_abline(slope=b,intercept=a)

b = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x))^2) 
b 
a = mean(y)-b*mean(x) 
residuals = (a+b*x)-y 
ggplot(NULL,aes(x=x,y=y)) + 
  geom_point(shape=4,size=10) + 
  geom_abline(intercept=a,slope=b) + 
  geom_rect(aes(xmin=x,xmax=x+residuals, 
                ymin=y,ymax=y+residuals), 
            fill="green",alpha=0.5) + 
  coord_fixed() + 
  xlim(3,17) + 
  ylim(3,12) 
SSR = sum(residuals^2) 
SSR

b = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x))^2) 
b 
a = mean(y)-b*mean(x) 
a 



library(tidyverse) 
summary(cars) 
x = cars$speed 
y = cars$dist




# Load data
data(cars)

ggplot(cars, aes(x = speed, y = dist)) +
  geom_point(color = "yellow", size = 2)+
  labs (
    title = "Stopping distance vs speed of cars ", 
    x = "Speed(mph)",
    y = "Stopping Distance(feet)"
    
  )

theme_minimal()




correlation = cor (cars$speed, cars$dist)
print(correlation)


# Fit linear model
model =  lm(dist ~ speed, data = cars)
# View coefficients
summary(model)

# Plot with regression line
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point(color = "blue", size = 2) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Stopping Distance vs Speed of 1920s Cars",
    x = "Speed (mph)",
    y = "Stopping Distance (feet)"
  ) +
  theme_minimal()


b = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x))^2) 
b 
a = mean(y)-b*mean(x) 
residuals = (a+b*x)-y 
ggplot(NULL,aes(x=x,y=y)) + 
  geom_point(shape=4,size=10) + 
  geom_abline(intercept=a,slope=b) + 
  geom_rect(aes(xmin=x,xmax=x+residuals, 
                ymin=y,ymax=y+residuals), 
            fill="green",alpha=0.5) + 
  coord_fixed() + 
  xlim(3,17) + 
  ylim(3,12) 
SSR = sum(residuals^2) 
SSR
