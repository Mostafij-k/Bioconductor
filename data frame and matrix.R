#create matrix 
my_mat<-matrix(1:20,byrow=TRUE, nrow=4, ncol=5)
my_mat
class(my_mat)
#convert matrix to data frame
my_data<- as.data.frame(my_mat)
my_data
class(my_data)#show class

dim(my_data)   #dimension of data frame

nrow(my_data)  #number of row

ncol(my_data)  #number of column

cbind(my_data, Z=1:4) #bind new column

rbind(my_data, 1:5)   #bind new row

#changing column and row namew imn data frame

colnames(my_data)<-c('A', 'B','C','D','E')
my_data
rownames(my_data)<-c('R1','R2','R3','R4')
my_data

# clear workspace
#run several data object
data1<-1
data<-2
data3<-3   
ls()      #Run ls object

rm(list = setdiff(ls(), 'df'))
ls()

#filter data and save as excel file
data(iris)
data_1 <- filter(iris, Species == "setosa")  #filter setosa species 
write.csv2(data_1, "data_1.csv")            #save data_1.csv in your current workind directory




