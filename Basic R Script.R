#Fundamentals of R

version  ## Check Version
getwd()      ## Show present working directory

setwd('/Users/user/Desktop/R script')  ## Set working directory

print('This my  first R Programming')  ## Display something

## Variable = One kind of container ----
var1 = 10
var1  # Display in Console
var2 = "I have keen interest in Bioinformatics"
print(var2)  # Display in console
var_3 = c(1,2,4,"A", TRUE)  # Here c use as 
print(var_3)

## assign(variable name, values)
assign('var_5', 40)
var_5
## Finding variable
print(ls(all.names=T))
## Delete Variable
rm(name)
#..................!!!!!!...............

## Data type in R ----

    # 1. Vectors = 6 types
 
# Logical = TRUE, FALSE
L = TRUE
print(class(L))
is.vector(L)

# Numeric = all number even fraction
N = c(22,22.1)
print(class(N))
is.numeric(N)

# Integer = All number without fraction, here L use as suffix. Also a numeric
I = 22L
print(class(I))
is.integer(I)

# Complex = 3+4i, 4i is an imagination part
C = 3+4i
print(class(C))
is.complex(C)
# Character = If something contains within a quotation mark, either double or single
C2 = c('a', 'b', '3', '3.6')
print(class(C2))
is.character(C2)

# Raw data
R = charToRaw("Study hard")
print(R)
print(class(R))

## How to create vector = By using c() Function
Sub = c("Micro", "genetics", "CHe")
print(Sub)

## Creating sequence of vector:
   #By colon
Bio = c(2:4)
Bio2 = 20:1
print(Bio2)
print(Bio)
   # By seq()
Bio3 = seq(1,50,3)  # Increment by 3
print(Bio3)

## Sorting a vector by using sort()
Bio4 = c(1,6,7,3,4,9,1,20,13,56,34,55,2,3,8,9,0,12,45,11,23,25)
sorted_Bio4=sort(Bio4)
print(sorted_Bio4)
Bio_4 = c('Mb','GB', 'CHE', 'M','EEE')
sorted_4 = sort(Bio_4)
print(sorted_4)

## Vector manipulation
    # Arithmetic operation
2+2
5-4
3*3
8/2
8^2
2^2+2*3-7
# Addition
Bio5 = c(1,2,3,4,5)
Bio6 = c(3,4,5,6,7)
result = Bio5+Bio6
print(result)

# Subtraction
Bio7 = c(4,5,6,7)
Bio8 = c(1,2,3,4)
result2= Bio7-Bio8
print(result2)

# Multiplication
result3=Bio7*Bio8
result3  

## Division
result4=Bio7/Bio8
result4

## Square
result5=Bio7^3
result4

## Show modulus = Remainder
result6=Bio7%%Bio8
result6

## Vector value recycling
Bio9=c(1,2,3,4,54,65)
Bio10= c(1,2) 
result7=Bio9+Bio10   # Here, Recycling occurs in Bio10 as it's contain less number than Bio9
result7

## Access in Vector
Bio11=c(2,3,4,66,77,89.34,11,22,33,44,55,66)
Bio11[2]  # In R Index starting with 1
index=Bio11[c(1,4,6,3,7)]
index
Bio11[-3]  # Drop the vector


##vector function
x=c(6,4,3,1,3,10,5)
length(x)
unique(x)  #give without duplicate
length(unique(x))  #lenght of unique element
which(x==3)  #which element are equale to 3

rev(x)  #return opposite

sort(x) #sort as numeric number

sum(x)
mean(x)
median(x)
quantile(x)
summary(x)
str(x)

     ## 2. Lists = R objects which contain different types of value like as number,character, string etc
            # Creates by list() function

Mb = list(1,TRUE,0,21.3,'micro',c(1,3,"5"), 'A', 45)
print(Mb)
class(Mb)
Mb[3]      # find element by using index



# Add element into list

append(Mb, 12)  # It will add at last by default
append(Mb, 30,after=0)
append(Mb, 44, after=3)

## List marge

Mb1=list(1,2,3,'4','a')
Mb2=list(4,5,6,'t','8')
print(c(Mb1,Mb2))     

## Delete element
Mb1[-2]
Mb2[c(1,4)]  # remove more then one number


# unlike vector contain multiple data type in list
gene = list(name='GAPDH', 
            protein_coding=TRUE,
            chromosome=13)   #contain three type of data
gene

#three way to extract element from list
gene[[1]]         #in list need two []
gene[['name']]
gene$name



     ## 3. Matrix  
   
        # Creates matrix by matrix()
my_max= matrix(1:10, nrow = 2) # Default take by row
my_max
my_max1= matrix(1:10, ncol = 2)  # Default take by column
my_max1
length(my_max1)
t(my_max1)  # trans position of matrix (row=column,column=row)

my_mat<-matrix(1:20,byrow=TRUE, nrow=4, ncol=5)  # bY ROW 
my_mat1<-matrix(1:20,byrow=FALSE, nrow=4, ncol=5)  # bY column
my_mat1
my_mat 
class(my_mat)  
my_mat[3,3] # Indexing

dim(my_mat)   # Dimension of data frame

nrow(my_mat)  # Number of row

ncol(my_mat)  # Number of column

cbind(my_mat, 1:4) # Create new column

rbind(my_mat, 1:5)   # Create new row

# matrix operation
print(my_mat+my_mat1)
print(my_mat*my_mat1)
print(my_mat/my_mat1)
print(my_mat-my_mat1)


## Convert matrix to data frame

my_data<- as.data.frame(my_mat)
my_data

## more example of matrix:

my_first_matrix<- matrix(1:12, nrow=4, ncol=3)  #by default R fill up column by column
my_first_matrix

my_first_matrix<- matrix(1:12, nrow=4, ncol=3,byrow=T)
my_first_matrix

my_first_matrix<- matrix(1:6, nrow=4, ncol=3)  #recycle the element

matrix(c(1:5,'a'), nrow=4,ncol=3)  #matrix contain one kind of value

length(my_first_matrix)
dim(my_first_matrix)  

t(my_first_matrix)  #trans position of matrix (row=column,column=row)

my_first_matrix[3:4,2:3]
my_first_matrix[3,]
my_first_matrix[c(T,F,T,F),]

as.vector(my_first_matrix)

t_matrix=t(my_first_matrix)
as.vector(t_matrix)  #as.vector going to column wise




     ## 4. Array
         ## More then two dimensional and create by array()
# Dimension(2,3,4)  # (4= created 4 rectangular matrix, contain row =2, column=3)
ar = array(1:12, dim= c(3,4,4))
ar
vec1= c(1:5)
vec2=c(10:25)
ar2= array(c(vec1,vec2), dim=c(3,5,2))
ar2
ar2[,,2]
ar2[1,3,2]

## Give name of array

rownames = c('row1','row2','row3')
colnames = c('col1','col2','col3', 'col4', 'col5')
matnames = c('max1', 'max2')
ar2= array(c(vec1,vec2), dim=c(3,5,2), dimnames = list(rownames, colnames,matnames))
ar2     

     ## 5. Factors
            # Are variable take limited number of value. also called categorical data 

movie_vec=c('comedy', 'action', 'crime', 'annimation', 'crime', 'romantic', 'comedy')
movie_fac= factor(movie_vec) 
movie_fac   ## so factor will give levels and give category
summary(movie_vec)
summary(movie_fac)  # Give list of value



chr_vec= c('chr3', 'chrX','chr2','che1','chr20', 'chr10')
is.character(che_vec)
is.vector(che_vec)
sort(che_vec)   #sort alphabetically

order_vec=paste0('chr', c(1:22, 'X', 'Y','M'))
order_vec
sort(order_vec)

cha_fac= factor(chr_vec, 
                levels=order_vec,
                ordered=T)
cha_fac

sort(cha_fac)


     ## 6. Data frames = data structure and store data as tabular format

df = data.frame(
  sid = c(1,2,3),
  name =c('jony', 'rony', 'rocky'),
  age = c(23,22,21)
)
print(df)

## access
df[2,]
df[2,3]
colnames(df)
rownames(df)
str(df)
summary(df)
ncol(df)
nrow(df)
dim(df)
df$dept=c('MB', 'GEBT', 'PHA')
df
df1 = cbind(df, result=c(3.45, 3.67, 3.70))  # Add column
df2 = rbind(df1, c(4, 'sony', 25, 'FMB', 3.23))   # Add row
df2
dim(df2)

df3 = data.frame(
  sid = c(5,6,7,8,9),
  name =c('arif', 'imran', 'tony', 'tanjil', 'wahid'),
  age = c(23,21,32,12,34),
  dept = c('CHE', 'PME', 'EEE', 'IPe', 'MEC'),
  result = c(3.45,3.00,2.50,3.32,3.40)
  )
df3
df4 = 

# merged two data frame
df4 = rbind(df2,df3)  
df4

## more data frame

df3=data.frame(gene_symbol = c('TP53', 'GAPDH', 'FO581'),
               fold_change=c(2.1,.45,1.3),
               p_value=c(.02,.04,.23),
               significant=c(T, T, F),
               stringsAsFactors = F)
df3

df3$gene_symbol
#extract element of data frame


df3[["gene_symbol"]]
df3$fold_change
df3[1]
df3[[1]]

df4=data.frame(gene_symbol = c('TP53', 'GAPDH', 'FO581'),
              fold_change=c(2.1,.45,1.3),
              p_value=c(.02,.04,.23),
              significant=c(T, T, F),
              stringsAsFactors = T )

df4$gene_symbol



# date format
df4$Bday = as.Date(c('1995-10-20', '1995-10-20', '2000-5-23', '2001-09-12','1994-10-21', '1995-10-20', '1995-10-20', '1995-10-20', '1995-10-20'))
print(df4)
str(df4)

# ..........!!!...............

## String ----
    # Consists by many Character vector
str1 = "I love Bioinformatics"
str2 = " also like to work with Data Science"
class(str1)

# Length of String
print(nchar(str1))

## Concatenation
print(paste(str1,str2))  # By default it take space between two string
print(paste(str1,str2, sep=' and'))

## Sub-string
substring(str1, 2,5)

## Change case
toupper(str2)
tolower(str1)

## Formation of Data
Nu = 23
as.str(Nu)
as.character(Nu)  # Change
format(Nu)  # Change
Nu1 = 22.1
class(Nu1)
as.integer(Nu1)
Nu2=format(26.7888555, digit=4)
Nu2


## Operators ----
  
        # 1. Arithmetic operators


2+2
5-4
3*3
8/2
8^2
2^2+2*3-7

x=6
y=5
print(x+y)  # Addition
print(x-y)  # Subtraction
print(x*y)  # Multiplication 
print(x/y)  # Division
All= print(x+y*x-y/x)
All
      
        ## 2. Relational operators: will return either TRUE or FALSE

             #  >,<,==,!=,=<,=> #

k=c(5,6,7,8)
m=c(11,12,15,14)
print(k<m)
print(k>m)
print(k!=m)
print(k==m)
print(k<=m)
print(k>=m)

        ## 3. Assignment operators

             # Left assignment operators= <-, = , <<-
             # Right assignment operators= ->, ->>

# Left assignment
A=c(1,2,3,4)
B<-c(1,2,3,4)    # All take value from right and assign into left
c<<-c(1,2,3,4)  

# Right assignment
c(1,4,5,6,6)->D
print(D)
c(6,7,8,9,5,6)->>E   # All take value from left and assign into right
print(E)


          ## 4. Logical Operators

# && = and operators

F=c(1,2,3,4)
G=c(0,1,3,4)
print(F&&G)
H=c(1,2,3,4)
I=c(2,3,4,5)
print(H&&I)  # Here both True

# || = 0r operators

J=c(1,2,3,4)
L=c(0,1234)
print(J||L)
P=c(0,34,0)
S=c(0,34,0)
print(P||S)  # Here both false

# & = this called element wise logical and operators

W=c(1,2,3,4,5)
X=c(0,3,4,5,0)
print(W&X)

# | = this is called element wise or operators

Q=c(1,0,3,4,6)
V=c(0,0,3,5,0)
print(Q|V)

# ! = Called logical not operators
Z= c(1,3,4,5,0,0,7,0,8,1.2)
print(!Z)  # Give alternative



## Make plot  ----

plot(1:10, 1:10)  

log(10)   #Simple argument

log(10, base=2)   #log2

log(10, base=10)  # log10

?log   # help function

##Variables assignment ----
x=10
x= log2(16)
y=x^2
x+y
x=log2(x)

#simple data type in R
x=3  #double
y= 'Bioinformatics'   #characters
z=FALSE     #Logical

is.double(x)   #return true
is.character(y)  #true
is.logical(z)    #true

#R has special data type infinity
2/0   #Inf
Inf-Inf   #return NaN
#NA=  missing observation

##function ----

c(1,2,3,45,,5,6,2)
my_vector=c(1,2,3,4,5,6)
is.double(my_vector)   #give true
is.vector(my_vector)  #give true
My_vector2=c('a','v','c','b')
is.character(My_vector2)

my_vector3=c(1,3,5,'a','f')
is.double(my_vector3)  #give false
is.character(my_vector3)  #give true
my_vector3  #give all vector are character

#In a mixed vector logical return into double and doublr return into character
#logical<double<character
c(TRUE,FALSE,3,4,'5')  #everything return into character

seq(1,6)
?seq
seq(1,6, by=2)
seq(6,1,by=-1)
?":"  #give help documentation 
6:1  #same as seq(6,1, by=-1)

rep(1:5, times=2)
rep(1:5, each=2)



my_vec=c(1,2,3,4,5)
myvec2=c(6,7,8,9,10)
my_vec+myvec2

my_vec=c(8,11)
myvec2=c(2,3,5,7)
my_vec+myvec2  #small vector replicate and add

length(my_vec)

sum(my_vec)

mean(my_vec)
median(my_vec)


## Some useful function ----

x=c(3,4,5,6,7,8,8,2,3,1,1,3,9,10)
y=c(4,5,6,7,8,9,1,2,3,100)
length(x)
unique(x)
union(x,y)
length(unique(x))
which(x==3)  # back element position
rev(x)   # Reverse
sort(x)   # Sorting according to numerical order

w = c('a', 'd', 'f', 's', 'w', 'g', 'v', 'b', 'c', 'e', 'm','l')
sort(w)  # sorting according to alphabetical order


paste0("Mostafij","Rahman")  # Combine values together
paste('Mostafij', 'Rahman')  # Space between two value

paste0('chr', seq(1,5))

# sub-setting 

vec=c(TRUE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
vec
x[vec]

# Relational operators ----

10==10
10!=10
10>10
'cat'>'cat'
'cat'<'dog'
10<9
10>=9
10<=10

x<5
x[x<5]  #filter less then 5 element

x[x==3]
length(x[x==3])
x %in% c(1,3,5)      # Give logical value
x[x%in%c(1,3,5)]
x[x%in%seq(2,10, by=2)]


'a' < 'A'
1<'a'
9%%4
9%%3  

## paste0 function
chr_vec=c('chr3', 'chrx', 'chr2', 'chr1', 'chr20', 'chr10')
chr_vec
sort(chr_vec)

order_vec=paste0('chr', c(1:22, 'X', 'Y','M'))

chr_fac= factor(chr_vec, 
                levels=order_vec,
                ordered=T)         ## Creating a factor using factor()
order_fac

sort(chr_fac)

        #..........!!!!!!!!!!!............!!!!!!!!!!........!!!!!!!!.......#

# How read excel file in R

# Install readxl packages

install.packages('readxl')  # Install 

library(readxl)  # You have to call library to carry work 

data<-read_excel('sample.xlsx')  # Apply read_excel to read excel file in your desire directory
data

hist(data$`Sale Price`)  # Create histogram 

data("iris")   #load iris data

data("mtcars")  #load mtcars data

# Write excel file 

install.packages('writexl')  # Install writexl packages

library(writexl)  

write_xlsx(iris, 'iris.xlsx')   # Save iris excel file in your present working directory

# Read csv file
df<-read.csv('airway_metadata.csv')  # Read csv file in your present working directory
df    

read.table(file="airway_metadata.csv", header=T, sep=',')  # You can also read csv file by this way

#write csv file
write.csv(mtcars, "mtcars.csv")

# Read .txt file

help(read.table)  # Run help function

#header always true

read.table(file="sample.txt", header=T, sep='\t')   # Read tab delimitate text file









