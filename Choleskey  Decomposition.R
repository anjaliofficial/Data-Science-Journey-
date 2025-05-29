#Step 1- Load necessary packages
# The MASS package contains useful functions for multivariate analysis
install.packages("MASS")
library(MASS)

#step 2: define the mean ans covariance 

mu = c(2, 3) # mean vector for the 2 variable (x1 and x2)

#create a symmetric positive definite covariance matrix 
#this represenrs the variance and correlation between x1 and x2 
sigma = matrix(c(1, 0.8,  # Var (x1 ) = 1, cov(x1,x2) = 0.8

        0.8, 1),
        nrow = 2, byrow = TRUE) # Cov(X2,X1) = 0.8, Var(X2) = 1

#Step 3 : Apply Cholesky decomposition 
#chol( returns an upper triangular matrix U such that sigma = U'U)
L= chol(sigma)
#if Your want a lower triangular matrix (LL^T), uset(L)

#Step 4 : generate samples using choolesky 

set.seed(123) # set random seed for reproducibility 
n = 2000 # number of samples you want to generate 

#generate standard normal (uncorrelated) samples 
#each row is a sample of two independent standard normals 
Z = matrix(rnorm(n*2), ncol = 2)

#Transform Z to hae the desired covariance structure 
# multiply Z by t(L) to xorrelate the variables
# add mu to shift from origin to desired mean 
samples = Z %*% t(L) +matrix(mu, n, 2, byrow = TRUE)

#Step 5 : Visualize thegerenate samples 
#plot the simulated multivariate normal data 

plot(samples, 
     col= rgb(0.2, 0.4, 0.6, 0.5), # transparent blue points 
     pch= 20,   # solid circles
     main = " Samples from multivariate normal distribution ", 
     xlab = "X1", 
     ylab = "X2"
     )


