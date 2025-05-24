#generate normal data 
data = rnorm(1000, mean = 0, sd = 1)

#plot histrogram 
hist (data, probability = TRUE, col = "lightblue", main = "Gaussiain fit ")

# overlau gaussian pdf 
curve (dnorm(x, mean = mean(data), sd = sd(data)), add = TRUE, col = "red", lwd = 2)


# Another example 

x = seq (-4,4, length.out = 1000)

#calculaye the density (pdf) of the standard normal distribution 
y = dnorm(x, mean = 0, sd = 1)

# plot the curve 
plot(x, y, type = "l", col= 'blue', lwd = 2,
     main = "Gaussian (normal) Distribution ", 
     xlab = "x", ylab = "Density "
     )


grid()

#------------------------------------------------Another one example  of it 

## ------------------------------
# Gaussian Fit to Real Data (mtcars$mpg)
# ------------------------------

# Load the dataset
data(mtcars)

# Extract the mpg (miles per gallon) column
mpg_data <- mtcars$mpg

# Plot histogram of the real data with probability densities
hist(mpg_data, probability = TRUE, col = "lightgreen", 
     main = "Gaussian Fit to Real Data (mpg)",
     xlab = "Miles Per Gallon (mpg)", border = "white")

# Calculate mean and standard deviation of the data
mu <- mean(mpg_data)
sigma <- sd(mpg_data)

# Overlay Gaussian curve
curve(dnorm(x, mean = mu, sd = sigma), 
      col = "red", lwd = 2, add = TRUE)

# Add a grid
grid()
