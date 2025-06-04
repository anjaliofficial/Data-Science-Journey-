# let ==== f(x,y)=x^2+xy+y^2






# Install and load the Deriv package
install.packages("Deriv")
library(Deriv)

# Define the scalar function
f <- function(x, y) x^2 + x*y + y^2

# Compute first derivatives manually
df_dx <- Deriv(f, "x")  # ∂f/∂x
df_dy <- Deriv(f, "y")  # ∂f/∂y
# Define the evaluation point
x_val <- 1
y_val <- 2

# Evaluate each partial derivative numerically at (1, 2)
h_xx_val <- h_xx(x = x_val, y = y_val)
h_xy_val <- h_xy(x = x_val, y = y_val)
h_yx_val <- h_yx(x = x_val, y = y_val)
h_yy_val <- h_yy(x = x_val, y = y_val)

# Create the numeric Hessian matrix
hessian_numeric <- matrix(c(h_xx_val, h_xy_val, h_yx_val, h_yy_val), nrow = 2, byrow = TRUE)

# Print the evaluated Hessian matrix
print(hessian_numeric)
