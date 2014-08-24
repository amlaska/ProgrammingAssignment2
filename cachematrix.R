## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
makeCacheMatrix <- function(x = matrix()) {
  ## Initialize to null to reset values of matrix in the function
  my_matrix <- NULL

  set <- function(y) {
    x <<- y
    my_matrix <<- NULL
  }

  ## Function to retrieve matrix
  get <- function() x

  ## Function that finds the inverse of the matrix
  setmatrix <- function(cur_matrix = matrix(x), ...) {
    my_matrix <<- solve(cur_matrix, ...)
  }

  ## Function to retrieve cached matrix
  getmatrix <- function() 
    my_matrix
  
  
  list(set = set, get = get,
       setmatrix = setmatrix, getmatrix = getmatrix)
}


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
  
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
  matrix_inverse <- setmatrix(my_matrix, ...)
  
  my_matrix
}