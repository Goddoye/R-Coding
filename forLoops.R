x <- 14
while (x>3){
  print (paste('X is:', x))
  x <- x-1
}

v <- c(1, 2, 3, 4, 5)
for (tempVar in v){
   print('Asuh dude')
}

v <- c(1, 2, 3, 4, 5)
for (tempVar in v){
  result <- tempVar 
  print(paste('This varibale is equal to:', result))
}

for (tempVar in v){
  print(paste('This varibale is equal to:', tempVar))
}

l <- list(c(1,2,3),mtcars,12)
for (item in l){
  print(str(l))
}


mat <- matrix (1:25, nrow=5)

for (row in 1:nrow(mat)){
  for (col in 1:ncol(mat)) {
    print(paste('The element at row:',row,'and col',col,'is',mat[row,col]))
  }
}

