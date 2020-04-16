v <- c(1:3)
m <- matrix(1:10, nrow = 2)
df <- mtcars

##Creating a list
myList <- list(v, m, df)


##Creating a list with names
myNamedList <- list(vector = v, matrix = m, dataframe = df)


##Grabbing specific portions out of a named list
#--Returns actual object
myNamedList$vector
myNamedList[['vector']]
#--Returns list class
myNamedList[3]
myNamedList['matrix']


##List nested in a list
doubleList <- c(myList, myNamedList)


##Discovering what objects are in a list
str(doubleList)
