## This moudule allows creating and manipulating a matrix which handles a cache 
## with its inverse

## Creates a matrix which can update its values (set), and keeps a cache of its inverse 

makeCacheMatrix <- function(the.matrix = matrix()) {
        inverse.matrix <- NULL
        
        set <- function(new.matrix) {
                the.matrix <<- new.matrix
                inverse.matrix <<- NULL
        }
        
        get <- function() the.matrix
        
        get.inverse.matrix <- function() {
                if (!is.null(inverse.matrix)) {
                        message("getting cached inverse matrix")
                } else {
                        inverse.matrix <<- solve(the.matrix)
                }
                inverse.matrix
        }
        
        list(set = set, get = get, get.inverse.matrix = get.inverse.matrix)
}


## Returns the inverse of matrix created through makeCacheMatrix()

cacheSolve <- function(the.matrix, ...) {
        the.matrix$get.inverse.matrix()
}
