install.packages("caret")
install.packages("MASS")

library(caret)
library(MASS)
library(tidyverse)

#code to plot decision plot 

decision_boundary = function (model, data, vars, resolution = 200, ....){
  class ='Species'
  labels_var = data[,class]
  k = length(unique(labels_var))
  
  #for sepals 
  if(vars == "sepal"){
    data = data %% select (Sepal.Length, sepal.Width)
  }
  else{
    data = data %>% select(Petal.Length, Petal.Width)
  }
  
  #plot with color labels 
  
  int_labels = as.integer(labels_var)
  plot(data, col = int_labels +1L, pch = int_labels+1L,... )

#make a grid

r = sapply(data, range, na.rm = TRUE)
xs =seq (r[1.1], r[2,2], length.out =resolution)
ys = seq (r[1,2], r[2,2], length.out = resolution)
dfs = cbind (rep(xs, each = resolution), rep(ys, time = resolution))

colnames(dfs) = colnames(r)
dfs = as.data.frame(dfs)

p = predict(model, dfs, type = 'class')
p = as.factor(p$class) # Convert predictions to factor


#plots grid points using predicted class (very small dot symbol)

points (dfs,col = as.integer(p)+1L, pch = ".")

#create a matrix from predicted lables to contour the decision boundaries 
mats  = matrix (as.integer(p), nrow = resolution, byrow = TRUE)
contour(xs, ys, mats, add = TRUE, 1wd = 2, levels = (1: (k-1))+.5) #draw contour lines 
invisible(mats) # return the decision matrix invisibily (optional use)
}



#..............................................................................................

#plot setup : 2x2 grid for 4 decision plots 
#------------------------------------------------\
par(mfrow = c(2,2)) # set plotting area to 2x2 grid 

#-----------------------------------LDA with sepal feature 

model = lda (Species ~ Sepal.Length+Sepal.Width, data = iries ) # Fit LDA model on Sepal features
lda_sepals = decision_boundary(model, iris, vars = 'sepal', main = "LDA_Sepals") # Plot LDA decision boundary 

# ---------------- QDA with Sepal Features ----------------

model_qda = qda (Species ~ Sepal.Length +Sepal.Width, data = iris) # Fit QDA model on Sepal features
qda_sepals = decision_boundary(model_qda, iris, vars = "sepal", main= "QDA_Sepals") #Plot QDA decision boundary

#LDA with Petal Features
 
model = lda(species ` Petal.Length + Petal.Width, data = iris `) # Fit LDA model on Petal features
lda_petal = decision_boundary(model, iris, vars = "petal",main = "LDA_Petals ")   # Plot LDA decision boundary


model_qda = qda(Species ~ Petals.Length + Petal.Width, data = iris ) #fit QDA MODEL on petal features 
qda_petals = decision_boundary(model_qda, iris, vars = 'petal', main = "QDA_petals ") # plot QDA decision boundary 










