# ✅ Load built-in mtcars dataset
data(mtcars)

# 🧮 Select horsepower (hp) as input and mpg as output
x <- mtcars$hp  # Feature (independent variable)
y <- mtcars$mpg # Target (dependent variable)

# ⚙️ Initialize model parameters
w <- 0.01      # Initial weight
b <- 0         # Initial bias
lr <- 0.0001   # Learning rate
n <- length(x) # Number of data points

# 🔁 Train for 100 iterations (epochs)
for(i in 1:100){
  
  # 🔮 Step 1: Make prediction using current model
  y_pred <- w * x + b  # Linear model: ŷ = wx + b
  
  # 📉 Step 2: Compute Mean Squared Error loss
  loss <- mean((y - y_pred)^2)
  
  # 🔗 Step 3: Compute gradients using the chain rule
  dl_dw <- (-2/n) * sum((y - y_pred) * x)  # Gradient w.r.t. weight
  dl_db <- (-2/n) * sum(y - y_pred)        # Gradient w.r.t. bias
  
  # 🔄 Step 4: Update the parameters using the gradients
  w <- w - lr * dl_dw
  b <- b - lr * dl_db
  
  # 🖨️ Print status every 10 epochs
  if(i %% 10 == 0){
    cat("Epoch:", i, "| Loss:", round(loss, 2), "| w:", round(w, 4), "| b:", round(b, 4), "\n")
  }
}

# plot : actual data and predicted regression line 
plot(x,y,
     main = "Linear Regression using gradient descent ", 
     xlab = "Horsepower (hp)", ylab = "miles per gallon (mpg)",
     pch = 19, col = "blue" # Blue points: actual data
     )

#add regreession line 
abline(a = b, b = w, col = "red", lwd = 2) # red line: predicted line 
legend  ("topright", legend = c("Actual data", " Fitted line"),
         col = c("blue", "red"), pch = c(19, NA), lty = c(NA, 1), lwd = c(NA, 2)
         )
