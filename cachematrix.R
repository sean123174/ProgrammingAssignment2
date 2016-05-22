## These functions returns the inverse matrix


## makeCacheMatrix function defines four functions (set, get, getinverse, and setinverse)
## that will return in the inverse matrix 

makeCacheMatrix <- function(x = matrix()) {
# set inverse matrix to null
	im <- NULL

# Captures the matrix
        set <- function(y) {
                x <<- y
                im <<- NULL
        }
        
# Gets the matrix 
get <- function() x

# Set the inverse matrix
        setinverse <- function(inverse) im <<- inverse

# Set the inverse matrix
        getinverse <- function() im

# Stores functions in a list and returns it
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}

##---------------------------------------------------------------------
## cacheSolve executes the four functions defined in makeCacheMatrix
## if the inverse matrix is already define it will return it from cache 
## otherwise it will derive the inverse matrix

cacheSolve <- function(x, ...) {

# Calls for the inverse matrix in cache
        im <- x$getinverse()
# If inverse matric is not null then returns the inverse matrix for cache
        if(!is.null(im)) {
                message("getting cached data")
                return(im)
        }

# Gets the matrix defined in makeCacheMatrix function
        data <- x$get()
# Solves for the inverse matrix
        im <- solve(data)
# loads inverse matrix into cache.
        x$setinverse(im)
# returns the inverse matrix
        im

}
