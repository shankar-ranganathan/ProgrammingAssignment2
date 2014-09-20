## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse.
## It contains set of functions

makeCacheMatrix <- function(x = matrix()) {
  
  ## Initialize the inverse property
  i <- NULL
  
  ## Method to set the matrix
  set <- function( matrix ) {
    x <<- matrix
    i <<- NULL
  }
  
  ## Method to get the matrix
  get <- function() {
    ## Return the matrix
    x
  }
  
  ## Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  ## Method to get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
    i
  }
  
  ## Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInversec = getInverse)

}


## Write a short comment describing this function
## cacheSolve is a function to compute the inverse of the "special" matrix. 
## Computing the inverse can be done with the Solve function in R.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i  <- x$getInverse()
  
  if (!is.null(i)){
    message("getting cached data")
    return(i)
  }

  ##Get the matrix from the object
  data  <- x$get()
  ## Calculate the inverse using matrix multiplication
  
  i  <- solve(data)
  ## Set the inverse of the object
  x$setInverse(i)
  
  i

}
