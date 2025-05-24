# Create a simple data frame with two numeric variables
data = data.frame(
  x = c(2.5, 3.6, 4.0),
  y = c(3.1, 3.9, 4.5)
)

# Compute covariance matrix of 'x' and 'y'
cov(data)

# Load the built-in iris dataset
data(iris)

# Compute covariance matrix for the first 4 numeric columns (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
cov(iris[, 1:4])   # 1:4 selects columns 1 to 4 (numeric features), excluding Species

# Perform PCA (Principal Component Analysis) on iris data
# center = TRUE subtracts the mean (centering the data)
# scale. = TRUE scales each variable to have unit variance (standardization)
pca_result = prcomp(iris[, 1:4], center = TRUE, scale. = TRUE)

# Compute covariance matrix of the PCA-transformed data (principal components)
cov(pca_result$x)  # pca_result$x contains the scores (coordinates in principal component space)
