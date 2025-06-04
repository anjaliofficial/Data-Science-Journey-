data(mtcars)
#select horse power (hp) as input and miles per gallon (mpg ) as output 
x = mtcars$hp # features (independent variable)
y = mtcar$mpg # target ( dependent variable)

# initialize model parameters 
 w = 0.01 # initial weight 
 b = 0 # initial bias 
 lr = 0.0001 # learning rate (small step size)
 n = length(x) # number of data points ( samples)
 # start training for 100 iterations (epochs)
 for(i in 1:100){
   
   # make prediction using current model
  y_pred = 1* x+b # Linear model predictions Y^ = wx +b
  
  # compute mean squared error loss
  loss = mean ((y-y_pred)^2) # loss functions:L = (1/n)*summision (y-y^)^2
  #compute gradients using the chain rule 
  dL_dw = (-2/n)* sum((y-y_pred)*x)   }
 #update the parameters using the gradients 
 w = w-lr*dl_dw #gradient dsecent update rule for weight 
 b = b-lr *dl_db # gradient descent update rule for bias 
 
# print loss every 10 iterations for tracking 
 if(i %% 10 == 0){
   cat ("Epoch :", i, "|Loss: ", round(loss, 2), "| w: ", round(w,4), "| b:", round(b, 4), "\n"
   )
        
        
        } 