# Step 1: Load dataset
data(iris)

# Step 2: Extract numeric features (remove Species)
iris_numeric <- iris[, 1:4]

# Step 3: Standardize the data
iris_scaled <- scale(iris_numeric)

# Step 4: Perform PCA
pca_model <- prcomp(iris_scaled)

# Step 5: Create a data frame with PCA results + Species
pca_data <- data.frame(pca_model$x[, 1:2])  # PC1 and PC2
pca_data$Species <- iris$Species

# Step 6: Plot PCA results using ggplot2
library(ggplot2)
ggplot(pca_data, aes(x = PC1, y = PC2, color = Species)) +
  geom_point(size = 2.5) +
  labs(title = "PCA of Iris Dataset (in R)",
       x = "Principal Component 1",
       y = "Principal Component 2") +
  theme_minimal()









# Load libraries
library(ggplot2)
library(reshape2)

# Step 1: Create a larger 5x5 matrix
A <- matrix(1:25, nrow=5, byrow=TRUE)

# Step 2: Perform SVD
svd_result <- svd(A)
U <- svd_result$u
D <- diag(svd_result$d)
V <- svd_result$v

# Step 3: Reconstruct the matrix
A_reconstructed <- U %*% D %*% t(V)

# Step 4: Print components
cat("Original Matrix:\n")
print(A)
cat("Singular Values (D):\n")
print(svd_result$d)

# Step 5: Plot singular values (bar chart)
singular_df <- data.frame(Index = 1:length(svd_result$d), SingularValue = svd_result$d)

ggplot(singular_df, aes(x = factor(Index), y = SingularValue)) +
  geom_bar(stat = "identity", fill = "darkorange") +
  theme_minimal() +
  labs(title = "Singular Values from SVD", x = "Index", y = "Singular Value")

# Step 6: Plot heatmaps of original and reconstructed matrix with custom ticks

# Define custom row and column labels
row_labels <- paste0("R", 1:nrow(A))
col_labels <- paste0("C", 1:ncol(A))

# Plot side-by-side heatmaps
par(mfrow = c(1, 2))  # two plots side by side

# Heatmap for original matrix
image(1:nrow(A), 1:ncol(A), t(A)[, nrow(A):1],
      col = heat.colors(20), main = "Original Matrix",
      xlab = "Columns", ylab = "Rows", axes = FALSE)
axis(1, at = 1:ncol(A), labels = col_labels)
axis(2, at = 1:nrow(A), labels = rev(row_labels))  # reverse due to image flip

# Heatmap for reconstructed matrix
image(1:nrow(A_reconstructed), 1:ncol(A_reconstructed),
      t(A_reconstructed)[, nrow(A_reconstructed):1],
      col = heat.colors(20), main = "Reconstructed Matrix",
      xlab = "Columns", ylab = "Rows", axes = FALSE)
axis(1, at = 1:ncol(A_reconstructed), labels = col_labels)
axis(2, at = 1:nrow(A_reconstructed), labels = rev(row_labels))
