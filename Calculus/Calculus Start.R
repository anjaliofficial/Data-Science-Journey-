# Day one of calculations

# Load the Deriv package which allows symbolic differentiation in R
library(Deriv)

# Define the revenue function: R(x) = 100x - 0.5x^2
# Here, 100*x is revenue per unit, and -0.5*x^2 shows diminishing returns
revenue <- function(x) { 100 * x - 0.5 * x^2 }

# Use Deriv() to calculate the symbolic derivative of the revenue function with respect to x
# Deriv automatically finds d(revenue)/dx
revenue_prime <- Deriv(revenue, "x")

# Print the derivative function to the console
# It should display: function(x) 100 - x
revenue_prime

# Plot the revenue function as a curve from x = 0 to x = 200
curve(revenue(x),              # Function to be plotted (revenue)
      from = 0, to = 200,      # 'from' and 'to' define the x-axis range
      col = "blue",            # 'col' sets the color of the line (blue)
      lwd = 2,                 # 'lwd' sets line width (2 = thicker line)
      ylab = "Revenue / Derivative",  # 'ylab' sets label for y-axis
      main = "Revenue and its derivative") # 'main' sets the main title of the plot

# Overlay the derivative curve on the same plot
curve(revenue_prime(x),       # The derivative function (100 - x)
      from = 0, to = 200,      # Same x range
      col = "red",             # Red color for derivative curve
      lwd = 2,                 # Same line width
      add = TRUE)              # 'add = TRUE' means plot this on top of existing graph

# Add a legend to the top right corner
legend("topright",                    # Position of legend box
       legend = c("Revenue", "dR/dx"),# Labels shown in the legend ("dR/dx" means derivative of Revenue w.r.t. x)
       col = c("blue", "red"),        # Color matching the plotted lines
       lwd = 2)                       # Line width for legend symbols

# Evaluate the derivative at x = 60 (i.e., what is dR/dx when x = 60?)
# This returns 100 - 60 = 40
revenue_prime(60)
