#day22

#Fundamentals of R

##calculation  ----
2+1-1-1

2+5*7   #2+(5*7)

plot(1:10, 1:10)  #make plot 

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
?":"  #give help documentaion
6:1  #same as se(6,1, by=-1)

rep(1:5, times=2)
rep(1:5, each=2)

length(my_vector)

sum(my_vector)

mean(my_vector)

myvec=c(1,2,3,4,5)
myvec2=c(6,7,8,9,10)
myvec+myvec2
 
myvec=c(8,11)
myvec2=c(2,3,5,7)
myvec+myvec2  #small vector replicate and add

#day23

x=c(6,4,3,1,3,10,5)

#vector function ----

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

paste0("Mostafij","Rahman")  #combine value together give mostafijRahman
paste('Mostafij', 'Rahman') #space between two value

paste0('chr', seq(1,5))

#subsetting
x[5]
x[c(1,5)]

vec=c(TRUE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
vec
x[vec]

#relational oparetors ----

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
x %in% c(1,3,5) #give logical value
x[x%in%c(1,3,5)]
x[x%in%seq(2,10, by=2)]


'a' < 'A'
1<'a'
9%%4
9%%3

#day24

#factors ----
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


#matrix ----
#2 dimensional data structure (vector)

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


#list ----
#unlike vector contain multiple data type
gene = list(name='GAPDH', 
            protein_coding=TRUE,
            chromosome=13)   #contain three type of data
gene

#three way to extract element from list
gene[[1]]         #in list need two []
gene[['name']]
gene$name

#Data frames ----
#similar to matrix and similar list

df2=data.frame(gene_symbol = c('TP53', 'GAPDH', 'FO581'),
              fold_change=c(2.1,.45,1.3),
              p_value=c(.02,.04,.23),
              significant=c(T, T, F),
             stringsAsFactors = F)
df2

df$gene_symbol
#extract element of data frame


df[["gene_symbol"]]
df$fold_change
df[1]
df[[1]]

df=data.frame(gene_symbol = c('TP53', 'GAPDH', 'FO581'),
              fold_change=c(2.1,.45,1.3),
              p_value=c(.02,.04,.23),
              significant=c(T, T, F),
              stringsAsFactors = T )

df$gene_symbol





