# Load necessary libraries
library(caret)        # For machine learning support
library(MASS)         # For LDA and QDA functions
library(tidyverse)    # For data manipulation using dplyr and others

# ---------------------------------------
# Function: decision_boundary
# Purpose: Plot the decision boundaries of LDA or QDA models
# ---------------------------------------
decision_boundary = function(model, data, vars, resolution = 200, ...) {
  
  class = 'Species'                  # Define target class variable
  labels_var = data[, class]        # Extract class labels
  k = length(unique(labels_var))    # Number of classes
  
  # Select features based on input ('sepal' or 'petal')
  if (vars == 'sepal') {
    data = data %>% select(Sepal.Length, Sepal.Width)
  } else {
    data = data %>% select(Petal.Length, Petal.Width)
  }
  
  # Plot the data points with color and shape based on class
  int_labels = as.integer(labels_var)
  plot(data, col = int_labels + 1L, pch = int_labels + 1L, ...)
  
  # Generate grid of points for prediction
  r = sapply(data, range, na.rm = TRUE)   # Get min/max for each feature
  xs = seq(r[1, 1], r[2, 1], length.out = resolution)  # Grid for x-axis
  ys = seq(r[1, 2], r[2, 2], length.out = resolution)  # Grid for y-axis
  dfs = cbind(rep(xs, each = resolution), rep(ys, time = resolution))  # Grid combinations
  
  colnames(dfs) = colnames(r)     # Set appropriate column names
  dfs = as.data.frame(dfs)        # Convert to data frame
  
  # Predict class labels on the grid points
  p = predict(model, dfs, type = 'class')
  p = as.factor(p$class)          # Convert predictions to factor
  
  # Plot grid points using predicted class (very small dot symbol '.')
  points(dfs, col = as.integer(p) + 1L, pch = ".")
  
  # Create a matrix from predicted labels to contour the decision boundaries
  mats = matrix(as.integer(p), nrow = resolution, byrow = TRUE)
  contour(xs, ys, mats, add = TRUE, lwd = 2, levels = (1:(k - 1)) + .5)  # Draw contour lines
  
  invisible(mats)   # Return the decision matrix invisibly (optional use)
}

# ---------------------------------------
# Plot setup: 2x2 grid for 4 decision plots
# ---------------------------------------
par(mfrow = c(2, 2))  # Set plotting area to 2x2 grid

# ---------------- LDA with Sepal Features ----------------
model = lda(Species ~ Sepal.Length + Sepal.Width, data = iris)     # Fit LDA model on Sepal features
lda_sepals = decision_boundary(model, iris, vars = 'sepal', main = "LDA_Sepals")  # Plot LDA decision boundary

# ---------------- QDA with Sepal Features ----------------
model_qda = qda(Species ~ Sepal.Length + Sepal.Width, data = iris) # Fit QDA model on Sepal features
qda_sepals = decision_boundary(model_qda, iris, vars = 'sepal', main = "QDA_Sepals")  # Plot QDA decision boundary

# ---------------- LDA with Petal Features ----------------
model = lda(Species ~ Petal.Length + Petal.Width, data = iris)     # Fit LDA model on Petal features
lda_petal = decision_boundary(model, iris, vars = 'petal', main = "LDA_petals")   # Plot LDA decision boundary

# ---------------- QDA with Petal Features ----------------
model_qda = qda(Species ~ Petal.Length + Petal.Width, data = iris) # Fit QDA model on Petal features
qda_petal = decision_boundary(model_qda, iris, vars = 'petal', main = "QDA_petals")  # Plot QDA decision boundary
