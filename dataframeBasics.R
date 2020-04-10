##Creating Data Frames
empty <- data.frame()
c1 <- 1:10
c2 <- letters[1:10]
df <- data.frame(colName1 =  c1, colName2 =  c2)
df
df <- unname(df)


###Importing and Exporting Data
df2 <- read.csv('somefile.csv')
write.csv(df, file = 'saved_df.csv')
df2 <- read.csv('saved_df.csv')
df2


##Getting Information about Data Frames
nrow(df)
ncol(df2)
colnames(df)
rownames(df2)
str(df)
summary(df2)


##Referencing Cells
#--Row 5, Column 2
df[[5,2]]
#--Row 5, Column Name
df[[5,'colName2']]
#--Reassigning values 
df[[2, 'colName1']] <- 9999

##Referencing Rows
#--Pulls the first row and all columns
df[1,]


##Referencing Columns
#--R dataframe
mtcars
#--Pulls columns as vectors
mtcars$mpg
mtcars[,2]
mtcars[,"gear"]
mtcars[['qsec']]
#--Pulls columns as dataframe
mtcars['mpg']
head(mtcars[c('mpg','cyl')])


##Adding Rows
df3 <- data.frame(colName1 =  2000, colName2 = 'new')
df3
dfnew <- rbind(df,df3)
dfnew


#Adding Columns
df$newCol <- colName1 * 2
df$newColcopy <- df$newCol
df


##Setting Column Names
colnames(df)
colnames(df) <- c('1','2','3','4')
colnames(df)[1] <- 'colName1'


#Selecting Multiple Rows
df[1:10,]
head(df,3)
#--Selecting everything except a certain row
df[-2,]
#--Single Conditional Statement
mtcars[mtcars$mpg > 20,]
mtcars[(mtcars$mpg > 20) & (mtcars$cyl) == 6,]
#--Multiple Conditional Statement
mtcars[(mtcars$mpg > 20) & (mtcars$cyl) == 6, c('mpg','cyl','hp')]
#--Grabbing Subset of Data Frame
subset(mtcars, mpg > 20 & cyl ==6)
#--Grabbing a column off a subet
subset(df,hp > 100 & wt > 2.5)$mpg


##Dealing with Missing Data
is.na(mtcars)
any(is.na(mtcars))
any(is.na(mtcars$mpg))
#--Replaces all null values 
df[is.na(df)] <- 0
mtcars$mpg[is.na(mtcars$mpg)] <- mean(mtcars$mpg)

 


