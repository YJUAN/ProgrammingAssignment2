## Those two following functions are used to cache the inverse of a matrix.

## makeCacheMatrix creats a list of 4 functions
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse of the matrix
# 4. get the value of the inverse of teh matrix


makeCacheMatrix <- function (x=matrix()){
	I <- NULL
	set <- function (y) {
		# Use "<<-" to assign a value to an object in an environment 
		# different from the current environment.
		x <<- y
		I <<- NULL
	}
	get <- function () x
	setinverse <- function() I<<-solve (x)
	getinverse <- function () I
	list (set=set, get=get, setinverse=setinverse, 	getinverse=getinverse)
}


cacheSolve <- function(x, ...){
	### Return a matrix that is the inverse of 'x'
	# It first checks if the inverse has already been computed before.
	# If yes, it get the result and skip recomputation. 
	# If not, it computes the inverse, sets the valuse in the cache.
	# This function assumes that the matrix is invertible.
	I <- x$getinverse()
	if (! is.null(I)){
		message("getting cached data")
		return(I)
	}
	data <- x$ get()
	I <- solve (data, ...)
	x$setinverse (I)
	return(I)
}