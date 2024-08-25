#read excel file

#install readxl packages
install.packages('readxl')

library(readxl)  #library call

data<-read_excel('sample.xlsx')  #apply read_excel to read excel file in your desire directory
data
hist(data$`Sale Price`)  #create histograme

data("iris")   #load iris data

data("mtcars")  #load mtcars data

#write excel file 

install.packages('writexl')  #install writexl packages

library(writexl)    #call library

write_xlsx(iris, 'iris.xlsx')   #save iris excel file in your present working directory

#read csv file
df<-read.csv('airway_metadata.csv')  #read csv file
df     #read csv file in your pwd

read.table(file="airway_metadata.csv", header=T, sep=',')  #you can read csv file by this way

#write csv file
write.csv(mtcars, "mtcars.csv")

#read txt file

help(read.table)  #run help function

#header always true

read.table(file="sample.txt", header=T, sep='\t')   #raed tab delimated txt file
