## The goal of these two functions is to improve the performance of calculating
## the inverse of a matrix by caching the result. In addition, this assignment 
## demonstrates the principals of scoping within functions.


## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  ## Initialize to null to reset values of matrix in the function
  my_matrix <- NULL
  
  ## If there is a matrix already cached, load it into x
  set <- function(y) {
    x <<- y
    my_matrix <<- NULL
  }
  
  ## Function to retrieve matrix
  get <- function() x
  
  ## Function that finds the inverse of the matrix
  setmatrix <- function(cur_matrix = x$get(), ...){ 
    my_matrix <<- solve(cur_matrix, ...)
  }
  ## Function to retrieve cached matrix
  getmatrix <- function() 
  my_matrix
  
  ## Store the variables in a list
  list(set = set, get = get,
       setmatrix = setmatrix)
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  my_matrix <- x$getmatrix
  
  ## If the matrix is not empty, print a message and return the matrix
  if(!is.null(my_matrix)) {
    message("Getting cached data")
    return(my_matrix)
  }
  
  ## Use the get function to get the cached version of the matrix
  my_matrix <- x$get()
  
  ## Use the solve function to find the inverse of the cached matrix
  my_matrix <- setmatrix(my_matrix)
  
  ## Cache the print the inverse of the matrix
  x$setmatrix(my_matrix)
  my_matrix
}
