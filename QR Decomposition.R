# Load data
data(mtcars)

# Feature matrix X with intercept
X = as.matrix(cbind(1, mtcars$hp, mtcars$wt))
y = as.matrix(mtcars$mpg)

# QR Decomposition
qr_decomp = qr(X)
Q = qr.Q(qr_decomp)
R = qr.R(qr_decomp)

# Compute coefficients
beta = solve(R, t(Q) %*% y)

# Convert to matrix and add names
beta = matrix(beta, nrow = 3, ncol = 1)  # Ensure it's 3x1 matrix
rownames(beta) = c("Intercept", "HP", "WT")
colnames(beta) = c("Estimate")

# Show result
beta
