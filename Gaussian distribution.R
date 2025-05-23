#generate normal data 
data = rnorm(1000, mean = 0, sd = 1)

#plot histrogram 
hist (data, probability = TRUE, col = "lightblue", main = "Gaussiain fit ")

# overlau gaussian pdf 
curve (dnorm(x, mean = mean(data), sd = sd(data)), add = TRUE, col = "red", lwd = 2)
