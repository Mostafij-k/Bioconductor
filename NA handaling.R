#find missing value in data frame
data8<-c(1,3,4,NA,6,NA,9,NA,NA)
data8
#return logical vector indicate NAs
is.na(data8)
#Return position of NAs
which(is.na(data8))


#remove data frame rows with NA value
data<-data.frame(x1=c(1,4,1,NA,6,7),
                 x2=c("xx",'yc',NA, 'ac',NA,NA),
                 x3=c(1,0,1,NA,NA,1))
#apply na.omit functio
data1<-na.omit(data)  #remove which rows contain at least one NA
data1
data2<-data[complete.cases(data), ] #apply complete.cases function
data3<-data[rowSums(is.na(data))==0,]  #apply rowSums and is.na function

#Above all three function are basic installation function in R

library(tidyr) #call tidyr function
data4<-data%>% drop_na()  #drop_na() function in tidyr
data5<-data[!is.na(data$x1),] #remove row if any missing value in column 1

#call dplyr 
library(dplyr)
data6<-filter(data,!is.na(data$x1))


#Handaling NAs value in R
data('airquality')  #load airquality data
airquality 
dim(airquality)
is.na(airquality)  #finding missing value
sum(is.na(airquality))   #count missing value
na.omit(airquality)   #omit na value (delete row contain NA)
mean(airquality$Ozone)  #mean of airquality No mean come due to NA
#now apply na.rm function
mean(airquality$Ozone, na.rm=TRUE)
is.na(airquality$Ozone)

#count NA VALUE IN R
sum(is.na(airquality))
sum(is.na(airquality$Solar.R))

colSums(is.na(airquality))   #show NA value in all columns


#R replace NA by column mean
data(airquality)
airquality
w<-airquality
w
w$Ozone[is.na(w$Ozone)]<-mean(w$Ozone,na.rm=TRUE)  #NA in ozon column replace by its mean

w2<-airquality
w2
for(i in 1:ncol(airquality)) {
     w2[ , i] [is.na(w2[,i])]<-mean(w2[,i], is.na=TRUE)
}


#install zoo package
install.packages("zoo")
library(zoo)
w3<-airquality
w3<-na.aggregate(airquality)  #na.aggregate function replace NA by mean
