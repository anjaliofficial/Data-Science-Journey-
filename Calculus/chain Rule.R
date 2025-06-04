# ✅ Load mtcars dataset
data(mtcars)

# Select variables
x <- mtcars$hp
y <- mtcars$mpg

# Initialize parameters
w <- 0.01
b <- 0
lr <- 0.0001
n <- length(x)

# Epoch count
epochs <- 100

# Store loss per epoch
loss_history <- numeric(epochs)

# Training loop
for (i in 1:epochs) {
  # Prediction
  y_pred <- w * x + b
  
  # Loss (MSE)
  loss <- mean((y - y_pred)^2)
  loss_history[i] <- loss  # Store loss at i-th index
  
  # Gradients using chain rule
  dl_dw <- (-2/n) * sum((y - y_pred) * x)
  dl_db <- (-2/n) * sum(y - y_pred)
  
  # Update parameters
  w <- w - lr * dl_dw
  b <- b - lr * dl_db
  
  # Print every 10 steps
  if (i %% 10 == 0) {
    cat("Epoch:", i, "| Loss:", round(loss, 2), "| w:", round(w, 4), "| b:", round(b, 4), "\n")
  }
}

# 📈 Plot 1: Regression line vs actual data
plot(x, y,
     main = "Linear Regression using Gradient Descent",
     xlab = "Horsepower (hp)", ylab = "Miles per Gallon (mpg)",
     pch = 19, col = "blue")
abline(a = b, b = w, col = "red", lwd = 2)
legend("topright", legend = c("Actual Data", "Fitted Line"),
       col = c("blue", "red"), pch = c(19, NA), lty = c(NA, 1), lwd = c(NA, 2))

# 📉 Plot 2: Loss vs Epoch
plot(1:epochs, loss_history, type = "l",
     main = "Loss vs Epoch",
     xlab = "Epoch", ylab = "Mean Squared Error (Loss)",
     col = "darkgreen", lwd = 2)
