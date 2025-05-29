# Load required libraries
library(ggplot2)   # For plotting
library(dplyr)     # For data manipulation

# Step 1: Prepare data
# --------------------
# Use only two species from the iris dataset for binary classification
iris_binary <- iris %>%
  filter(Species != "virginica")  # Keep only 'setosa' and 'versicolor'

# Step 2: Visualize the data
# --------------------------
# Plot Sepal.Length vs Sepal.Width, color by species
ggplot(iris_binary, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Iris Data: Binary Classification (Setosa vs Versicolor)")

# Step 3: Fit Logistic Regression Model
# -------------------------------------
# Logistic regression for binary classification
model <- glm(Species ~ Sepal.Length + Sepal.Width, data = iris_binary, family = "binomial")

# View summary of the model
summary(model)

# Step 4: Add Decision Boundary to Plot
# -------------------------------------
# Create a grid of values for plotting decision boundary
x_vals <- seq(min(iris_binary$Sepal.Length), max(iris_binary$Sepal.Length), length.out = 100)
y_vals <- seq(min(iris_binary$Sepal.Width), max(iris_binary$Sepal.Width), length.out = 100)
grid <- expand.grid(Sepal.Length = x_vals, Sepal.Width = y_vals)

# Predict probabilities for grid
grid$prob <- predict(model, newdata = grid, type = "response")

# Step 5: Plot decision boundary (prob = 0.5)
# -------------------------------------------
ggplot(iris_binary, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  geom_contour(data = grid, aes(z = prob), breaks = 0.5, color = "black") +
  labs(title = "Logistic Regression Decision Boundary (Linear Separability)")
