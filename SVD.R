
#Here’s a simple R example to just perform SVD on a matrix and see its components (U, Σ, V):

#Define matrix
M = matrix (c(1,3,5,2,4,6), nrow = 3, ncol = 2)
print("Original matric M:")
print(M)

#perfom SVD decomposition

svd_result = svd(M)

U = svd_result$u
sigma = svd_result$d
V = svd_result$v

#print the results 
print("Matrix U (left singular vectors):")
print(U)

print("Singular values(sigma):")
print(sigma)

print("Matrix V (right singular vectors):")
print(V)



# Application of SVD
#1. how to compute the pseudo-inverse of a matrix using SVD
# Define matrix M (3 rows, 2 columns)
M <- matrix(c(1, 3, 5, 2, 4, 6), nrow = 3, ncol = 2)

# SVD decomposition
svd_result <- svd(M)
U <- svd_result$u       # 3x2
Sigma <- svd_result$d   # Vector of 2 values
V <- svd_result$v       # 2x2

# Step 2: Create Sigma+ (2x2 diagonal matrix with reciprocals of Sigma)
Sigma_plus <- diag(1 / Sigma)  # 2x2

# Step 3: Calculate pseudo-inverse M+ = V %*% Sigma_plus %*% t(U)
M_plus <- V %*% Sigma_plus %*% t(U)  # Result is 2x3

# Print pseudo-inverse
print("Pseudo-inverse matrix M+ :")
print(round(M_plus, 6))  # Rounded for better viewing

# Verification
reconstructed_M <- M %*% M_plus %*% M
print("Check M * M+ * M:")
print(round(reconstructed_M, 6))

