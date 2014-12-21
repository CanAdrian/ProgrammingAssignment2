## These Functions allow you to create a special matrix with cached values and
## calculate and cache the inverse of the matrix. 

## Creates a list of functions
## set = Sets the matrix to a given matrix
## get = retrieves the previously given matrix
##setInv = Calculates the inverse of the matrox and solves it. 
##getInv = Retrieves the previously calculated inverse. 

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInv <- function() 
        {
              inv <<- solve(x)
        }
    getInv <- function() inv
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)
}


## This Function will create a cached matrix and solve for the inverse 
## if the inverse has not been calculated yet. 

cacheSolve <- function(x, ...) {
    y<-makeCacheMatrix()
    y$set(x)
    if( is.null(y$getInv()))
        {
            y$setInv()
        }
    y$getInv()
}
