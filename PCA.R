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
