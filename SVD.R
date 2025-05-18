
#Here’s a simple R example to just perform SVD on a matrix and see its components (U, Σ, V):

#Define matrix
M = matrix (c(1,3,5,2,4,6), nrow = 3, ncol = 2)
print("Original matric M:")
print(M)

#perfom SVD decomposition

svd_result = svd(M)

U = svd_result$u
sigma = svd_result$d
V = svd_result$v

#print the results 
print("Matrix U (left singular vectors):")
print(U)

print("Singular values(sigma):")
print(sigma)

print("Matrix V (right singular vectors):")
print(V)