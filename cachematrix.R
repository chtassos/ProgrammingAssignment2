##This function, creates a special "matrix", which is really a list containing a function to

##set the value of the matrix
##get the value of the matrix
##set the value of the inverse matrix
##get the value of the inverse matrix

##and also contain a variable "sq" with which checked if the given matrix is squared

makeCacheMatrix <- function(x = matrix(,1,1)) {
	  sq=0
	  if(!(dim(x)[1]==dim(x)[2])){
		sq=1
	  }
	  print(sq)
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
	  getSq <- sq
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse,
		 getSq = getSq)
}

##The following function calculates the inverse matrix of the special "matrix" created 
##with the above function. However, it first checks to see if the inverse matrix has 
##already been calculated. If so, it gets the inverse matrix from the cache and skips the computation.
##Otherwise, it calculates the inverse matrix of the data and sets the value of the inverse matrix in the cache 
##via the setinverse function.

cacheSolve <- function(x, ...) {
	  if(x$getSq == 1){
		return("Not square matrix")
	  }
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}