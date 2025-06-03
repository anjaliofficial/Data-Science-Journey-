# gradient descent

# DEFINE  the cost funcion : J(W) = w^2
# This represents the error -- we want to minimize it. 

cost = function(w){
  return(w^2)
}

#define the gradient (derivative ) of the cost function : dj/dw = 2w
#this  tells us the slpoe (direction and steepness) of the curve at a given w.
gradient  = function(w){
  return(2*w)
}

#Initilization 
w = 5 #starting value of the parameter w (a huess)
alpha = 0.1 # learning rate (step size)
iterations = 15 # number of steps to take 
w_values  = numeric(iterations+1) # store value of w at each step 
cost_values = numeric(iterations+1)  #store the cost at each step 

# perform gradient descent loop
w_values[1] = w 
cost_values[1] = cost(w)
for (i in 1:iterations){
  w = w-alpha*gradient(w) # move in opposite directions of the gradient 
  w_value[i+1] = w # save u[pdated w]
  cost_values[i+1] = cost(w) # save cost at updated w 
  
}

# plot the cost function curve 
curve(w^2, from = -6, to = 6, col = "blue", lwd = 2,
      xlab = "w", ylab = "Cost J (W)", 
      main = "Gradient Descent Visualization "
      )

#plot the stpes taken by gradient descent 
points (w_values, cost_values, col= "red", pch = 19 ) # red dots 
lines(w_values, cost_values, col = "gray", lty = 2) # dashed lines showing path 

# add legend 
legend("topright", legend = c("Cost function", "GD steps"),
       col = c("blue", "red",lty = c(1, NA), pch = c(NA, 19))
       )