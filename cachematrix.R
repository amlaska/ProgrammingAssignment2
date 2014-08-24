## The goal of these two functions is to improve the performance of calculating
## the inverse of a matrix by caching the result. In addition, this assignment 
## demonstrates the principals of scoping within functions.

<<<<<<< HEAD

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  ## Initialize to null to reset values of matrix in the function
  my_matrix <- NULL
  
  ## If there is a matrix already cached, load it into x
=======
## Write a short comment describing this function
makeCacheMatrix <- function(data = numeric(length = 0), ...) {
  ## Initialize to null to reset values of matrix in the function
  my_matrix <- NULL
  x <<- matrix(data,...)

>>>>>>> FETCH_HEAD
  set <- function(y) {
    x <<- y
    my_matrix <<- NULL
  }

  ## Function to retrieve matrix
  get <- function() x

  ## Function that finds the inverse of the matrix
<<<<<<< HEAD
  setmatrix <- function(cur_matrix = x$get(), ...){ 
    my_matrix <<- solve(cur_matrix, ...)
  }
=======
  setmatrix <- function(cur_matrix = x, ...) {
    my_matrix <<- solve(cur_matrix, ...)
  }

>>>>>>> FETCH_HEAD
  ## Function to retrieve cached matrix
  getmatrix <- function() 
    my_matrix
  
  ## Store the variables in a list
  list(set = set, get = get,
       setmatrix = setmatrix, getmatrix = getmatrix)
}


<<<<<<< HEAD
## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
=======
## Write a short comment describing this function
cacheSolve <- function(data, ...) {
  x <- makeCacheMatrix(data,...)
  
>>>>>>> FETCH_HEAD
  ## Return a matrix that is the inverse of 'x'
  matrix_inverse <- x$getmatrix()
  
  ## If the matrix is not empty, print a message and return the matrix
  if(!is.null(matrix_inverse)) {
    message("Getting cached data")
    return(matrix_inverse)
  }
  
  ## Use the get function to get the cached version of the matrix
  my_matrix <- x$get()
  
  ## Use the solve function to find the inverse of the cached matrix
  x$setmatrix()
  matrix_inverse <- x$getmatrix()  
  matrix_inverse
}
