
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

install.packages('jpeg')
install.packages('pracma')


library(jpeg) #For image reading 
library(pracma) # for SVD and matrix ops
library(ggplot2)
# -----------------------------------------
# PART 1: Pseudo-inverse of Matrix X
# -----------------------------------------

x = matrix(c(3, 3, 2, 2, 3, -2), nrow = 2, byrow = TRUE)
print("Original matrix X:")
print(x)

svd_result = svd(x)
U = svd_result$u
sigma = svd_result$d
V = svd_result$v

print("U:")
print(U)
print("Singular Values:")
print(sigma)
print("V^T:")
print(t(V))

# Inverse of sigma
sigma_inverse = diag(1 / sigma, nrow = length(sigma))

# Add padding for shape match: create full inverse Sigma matrix (3x2)
sigma_full = matrix(0, nrow = ncol(x), ncol = nrow(x))  # 3x2
sigma_full[1:length(sigma), 1:length(sigma)] = sigma_inverse

# Compute Pseudo-inverse: X+ = V * Sigma_inv * U^T

# Compute pseudo-inverse: only use first 2 columns of V
M = V[, 1:2] %*% sigma_inverse %*% t(U)

print("Pseudo-inverse of X:")
print(round(M, 6))


# -----------------------------------------
# PART 2: Image Compression using SVD
# -----------------------------------------

# Load required libraries
if (!require("jpeg")) install.packages("jpeg")
library(jpeg)

# Load R logo image
img_path = system.file("img", "Rlogo.jpg", package = "jpeg")
cat_img = readJPEG(img_path)

# Convert to grayscale
gray_cat = 0.2989 * cat_img[,,1] + 0.5870 * cat_img[,,2] + 0.1140 * cat_img[,,3]

# SVD on grayscale image
svd_cat = svd(gray_cat)
U = svd_cat$u
sigma = svd_cat$d
V = svd_cat$v

# Plot compressed images with different ranks
ranks = c(5, 10, 70, 100, 200)
par(mfrow = c(5, 2), mar = c(2, 2, 2, 2))

for (r in ranks) {
  approx_cat = U[, 1:r] %*% diag(sigma[1:r]) %*% t(V[, 1:r])
  
  image(t(apply(approx_cat, 2, rev)), col = gray.colors(256),
        main = paste("Compressed Image (k =", r, ")"), axes = FALSE)
  
  image(t(apply(gray_cat, 2, rev)), col = gray.colors(256),
        main = "Original Image", axes = FALSE)
}
