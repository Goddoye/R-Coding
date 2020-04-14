#CSV FILES
## Writing CSV Files
write.csv(mtcars, file = 'mtcars.csv')


## Reading CSV Files
#--Create path to file if it isnt in working directory.
ex <- read.csv('CSV_files/mtcars.csv')

#-----------------------------------------------------------------------------
#EXCEL FILES
##Install/import libraries
install.packages('readxl')
install.packages('xlsx')


## Reading Single Excel Sheet
library(readxl)
excel_sheets('CSV_files/PowersportVehicleTypeSizeclassChanges_Final.xlsx')
df <- read_excel('CSV_files/PowersportVehicleTypeSizeclassChanges_Final.xlsx')


## Reading entrie Excel Worksheet
library(readxl)
entireWorkbook <- lapply(excel_sheets('CSV_files/PowersportVehicleTypeSizeclassChanges_Final.xlsx'), read_excel,path='CSV_files/PowersportVehicleTypeSizeclassChanges_Final.xlsx')


##Writing Excel File
library(xlsx)
write.xlsx(mtcars, "output_example.xlsx")


#--You can call functions on excel files
sum(df$configurationId)
str(df)

#-----------------------------------------------------------------------------
#SQL WITH R
library(bit64)
library(tidyr)
library(lubridate)
library(readr)
library(RPushbullet)
library(RPostgreSQL)
library(DBI)
library(jsonlite)
library(httr)
library(curl) 





pw <- {
  "PRDAnalystRO2020!"
}



# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")
# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database
con <- dbConnect(drv, dbname = "pricedigests",
                 host = "db.pricedigestsapi.com", port = 5432,
                 user = "prd_analyst_ro", password = pw)



DataFramespecs<-dbGetQuery(con,'Select p1."classificationId", p1."classificationName",
                           p2."categoryId", p2."categoryName",
                           p3."subtypeId", p3."subtypeName",
                           p4."sizeClassId",p4."sizeClassName",p4."sizeClassMin",p4."sizeClassMax",
                           p5."configurationId",p5."modelYear",
                           p6."modelId",p6."modelName",
                           p7."manufacturerId", p7."manufacturerName", p8."configurationId", p8."specValue",p8."specName", p8."specDescription", p8. "specNameFriendly", p8. "specUom", p8. "specFamily", p8. "id"
                           from staging."classifications" p1
                           JOIN staging."categories" p2 on p1."classificationId" = p2."classificationId"
                           JOIN staging."subtypes" p3 on p2."categoryId" = p3."categoryId"
                           JOIN staging."sizeclasses" p4 on p3."subtypeId" = p4."subtypeId"
                           JOIN staging."configurations" p5 on p4."sizeClassId" = p5."sizeClassId"
                           JOIN staging."models" p6 on p5."modelId" = p6."modelId"
                           JOIN staging."manufacturers" p7 on p6."manufacturerId" = p7."manufacturerId"
                           JOIN staging."specs" p8 on p5."configurationId" = p8."configurationId"
                           where p2."classificationId" = 3 and p7."manufacturerId" = \'177\' and p5."modelYear" = \'2020\'')


