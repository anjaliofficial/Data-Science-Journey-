
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




#-------------------------------------------------------------------------------------
# Install required packages (only needed once)
install.packages('jpeg')
install.packages('pracma')

# Load libraries
library(jpeg)     # For reading JPEG images
library(pracma)   # For numerical operations like SVD
library(ggplot2)  # For plotting (not used here but often useful)

# -----------------------------------------
# PART 1: Pseudo-inverse of Matrix X
# -----------------------------------------

# Define a 2x3 matrix
x = matrix(c(3, 3, 2, 2, 3, -2), nrow = 2, byrow = TRUE)
print("Original matrix X:")
print(x)

# Perform SVD on matrix x
svd_result = svd(x)
U = svd_result$u            # Left singular vectors (2x2)
sigma = svd_result$d        # Singular values (vector of length 2)
V = svd_result$v            # Right singular vectors (3x3)

# Show components
print("U:")
print(U)
print("Singular Values:")
print(sigma)
print("V^T:")               # t(V) gives the transpose of V
print(t(V))

# Create diagonal matrix with reciprocal of singular values
sigma_inverse = diag(1 / sigma, nrow = length(sigma))  # diag() creates a diagonal matrix

# Pseudo-inverse: Use only first 2 columns of V to match dimensions
# Matrix multiplication: V[, 1:2] selects the first 2 columns (from 3x3 V) to make it 3x2
# t(U) is the transpose of U (2x2 becomes 2x2), making the shapes match for multiplication
M = V[, 1:2] %*% sigma_inverse %*% t(U)

print("Pseudo-inverse of X:")
print(round(M, 6))   # round() limits decimal precision for cleaner output


# -----------------------------------------
# PART 2: Image Compression using SVD
# -----------------------------------------

# Load JPEG image (R logo)
img_path = system.file("img", "Rlogo.jpg", package = "jpeg")
cat_img = readJPEG(img_path)  # Reads JPEG into a 3D array (rows x cols x 3 color channels)

# Convert RGB image to grayscale using standard luminance formula
gray_cat = 0.2989 * cat_img[,,1] +   # Red channel
  0.5870 * cat_img[,,2] +   # Green channel
  0.1140 * cat_img[,,3]     # Blue channel

# Apply SVD to the grayscale image matrix
svd_cat = svd(gray_cat)
U = svd_cat$u                        # Left singular vectors
sigma = svd_cat$d                   # Singular values
V = svd_cat$v                        # Right singular vectors

# Prepare to plot images in a 5x2 layout (mfrow = rows, cols)
par(mfrow = c(5, 2), mar = c(2, 2, 2, 2))  # mar = margin sizes for plots

# Try compressing with different ranks (i.e., how many singular values to keep)
ranks = c(5, 10, 70, 100, 200)

for (r in ranks) {
  # diag(sigma[1:r]) creates an r x r diagonal matrix with top-r singular values
  # U[, 1:r] = first r columns of U
  # V[, 1:r] = first r columns of V
  # %*% = matrix multiplication
  approx_cat = U[, 1:r] %*% diag(sigma[1:r]) %*% t(V[, 1:r])
  
  # Display the compressed image
  # apply(..., 2, rev) = flips the matrix vertically (required for correct orientation in image plot)
  # t(...) = transpose matrix so it shows correctly in R's coordinate system
  image(t(apply(approx_cat, 2, rev)), col = gray.colors(256),  # gray.colors = grayscale palette
        main = paste("Compressed Image (k =", r, ")"),         # main = title
        axes = FALSE)                                          # axes = FALSE hides the axis ticks
  
  # Show original image next to compressed version
  image(t(apply(gray_cat, 2, rev)), col = gray.colors(256),
        main = "Original Image", axes = FALSE)
}
