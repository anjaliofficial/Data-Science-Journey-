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


# ===============================
# 3D Multivariate Normal Sampling
# ===============================

# Step 1: Define the mean and covariance
mu3 = c(1, 2, 3)
sigma3 = matrix(c(1, 0.5, 0.3,
                  0.5, 1, 0.4,
                  0.3, 0.4, 1), nrow = 3, byrow = TRUE)

# Step 2: Cholesky decomposition (Upper triangular L such that sigma = L'L)
L3 = chol(sigma3)

# Step 3: Generate 1000 standard normal samples (uncorrelated)
set.seed(42)
n = 1000  # Correct variable name, replacing incorrect 'b'
Z3 = matrix(rnorm(n * 3), ncol = 3)

# Step 4: Apply Cholesky transformation and add mean
samples3 = Z3 %*% t(L3) + matrix(mu3, n, 3, byrow = TRUE)

# Step 5: 3D Plot using scatterplot3d
if (!require("scatterplot3d")) install.packages("scatterplot3d")
library(scatterplot3d)

scatterplot3d(samples3, pch = 16, color = "blue", main = "3D Multivariate Normal")

# ===============================
# Ridge Regression Using Cholesky
# ===============================

# Step 1: Simulate input data
set.seed(101)
X = matrix(rnorm(100 * 10), 100, 10)  # 100 observations, 10 features
y = rnorm(100)                        # Target variable

# Step 2: Ridge Regression setup
lambda = 1  # Regularization parameter

# Step 3: Create XtX + λI and Xᵗy
XtX = t(X) %*% X + lambda * diag(ncol(X))
Xty = t(X) %*% y

# Step 4: Solve using Cholesky
L = chol(XtX)  
z = forwardsolve(t(L), Xty)
beta_ridge = backsolve(L, z)

# Step 5: Output coefficients
print(beta_ridge)
