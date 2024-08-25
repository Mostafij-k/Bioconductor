data<-data.frame(x=1:6,
                 y= c(1,2,2,3,1,2),
                 z=c('F','B','C','E','A','D'))
data
#call dplyr packages
library(dplyr)
#arrange function sort data acording to number or caracter(A,B,C,D OR 1,2,3,4)
arrange(data,z)  #(arrange=A,B,C,D,E,F)
arrange(data,x)  #(arrange=1,2,3,4,5,6)

#filter function filter data from data frame
filter(data, y==2) #filter data (x=y)

#apply mutate function
mutate(data, v=x+y) #Here new v column appear and this new veriable contain sum of x and y

#apply the pull function that extract the element and show as vector
pull(data, y)

#apply rename function which rename the column of our data
rename(data, new_c=y)

set.seed(765) #set seed for reproducibility

#apply sample_n function to rerows randomly
sample_n(data,3)

#appyly select function to extract subset of our column
select(data, c(y,z))

#Join data with dplyr in R
#make Two data
data1<-data.frame(ID=1:2,
                  X1=c('a1','a2'))
data2<-data.frame(ID=2:3,
                  X2=c('b1','b2'))

inner_join(data1,data2, by="ID") #join data on the basis of common element(here=2) by row or by column

left_join(data1,data2, by='ID')  
#here left join contain all row of first data frame and contain share element of 2nd data(share=2)

right_join(data1,data2, by ="ID")  #contain all right data frame
full_join(data1,data2, by="ID")
semi_join(data1,data2, by="ID")
anti_join(data1,data2, by="ID") #vedio statistics globe

#create three data frame
data1<-data.frame(x1=1:5,
                  x2=letters[1:5])
data2<-data.frame(x1=0,
                  x3=5:9)
data3<-data.frame(x3=5:9,
                  x4=letters[5:9])
#apply bind_rows function
bind_rows(data1,data2)
#apply bind_cols function
bind_cols(data1,data3)

#arrange function in dplyr
data4<-bind_cols(data1,data3)  #create data frame
arrange(data4, x1)  #sort data
arrange(data4, x1,x4)  #sort in multiple column
data("mtcars")
is.na("mtcars")
arrange(mtcars, cyl)

#filter function
filter(mtcars, cyl==4)
filter(mtcars, cyl>=5 & cyl<=6)

#mute and transmute in data
head(mtcars)
#apply mutate function
mutate(mtcars, sanid=gear+carb)  #craete new column sanid
#apply transmute function
transmute(mtcars, sanid=gear+carb) #here output only sanid variable not all data frame

#extract column of tibble in R
hp<-mtcars%>% pull(hp)
hp                      #extract hp veriable from mtcars

#subset data 
filter(mtcars, hp==110)

data3[data3$x3==6,]  #subset rows
mtcars[mtcars$hp==110,]  #subset rows
mtcars[mtcars$hp!=110,]
mtcars[mtcars$hp %in% c(175,110), ]   #subset by usig %in%
subset(mtcars, mpg==21.0)     #using subset function

# covert data frame into tabble 
# apply as.tbl function after calling dplyr package
data("women")
as.tbl(women)
data1<-tibble::as_tibble(women)   #Both create tibble from data frame
is.tbl(data1)
data1$height
library(nycflights13)
flights
is.tbl(flights)     #flights is a tibble 
flight$dep_time      # Error in Tibbles are strict about subsetting
# In tibbles if you try to access a variable that does not exist, you will  get an error.

# Apply pull function
pull(women, 1)   #Pull function with index
pull(women, weight)  #pull function with variable

# Apply select and rename function
select(women, weight)  #select weight variable

rename(women, Weight_C2=weight)   # weight variable name chane into weight_C2

#Numberig rows within groups of data frame
data<-data.frame(x1=1:10,
                 group= c(rep('g1', 3),
                          rep('g2', 5),
                          rep('g3',2)))
#Apply ave f unction
 data2<-data
data2$numbering<-ave(data2$x1,
                     data2$group,
                     FUN=seq_along)   # Numbering in Group by using ave function

#use dplyr packages for numbering
data3<-data # Replicate orginal data
data3<-data3 %>%
    group_by(group) %>%
    mutate(numbering=row_number())   
