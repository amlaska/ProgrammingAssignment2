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
  setmatrix <- function(solve) 
  my_matrix <<- solve
  
  ## Function to retrieve cached matrix
  getmatrix <- function() 
  my_matrix
  
  
  list(set = set, get = get,
       setmatrix = setmatrix)
}


## Write a short comment describing this function

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
