#Day25

#BiocManager Install ----
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.13")

install.packages('Biobase') #Don't work because this packages distribute by bioconductor

install("Biobase")  #Now install Biobase by this command

install.packages('tidyverse')
install("multtest")    #hypothesis testing and access some data

##Attach required packages ----
library(multtest)
library(ggplot2)

##Leukomia microarry dataset ----

# go to  golub description for more details
data(golub)  #golub gene expression data
head(golub)
head(golub.gnames)
golub.cl


nrow(golub)
ncol(golub)
dim(golub)
golub.gnames[1042,]
golub[1042,2]
golub[1042,]
golub.cl == 0

golub[1042,golub.cl==0]

mean(golub[1042,golub.cl==0])  #ALL patients
mean(golub[1042,golub.cl==1])  #AML patients = myeloid leukomia

## plot CCND3 gene expression ----

ccnd3_exp=golub[1042,]
golub.factor = factor(golub.cl, levels=0:1, 
                      labels=c('ALL', 'AML'))

df= data.frame(ccnd3_exp, golub.factor)
df

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot()

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot(aes(fill=golub.factor))

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_violin(aes(fill=golub.factor))
   
ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_violin(aes(fill=golub.factor))+
  geom_point()

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot(aes(fill=golub.factor)) +
  geom_jitter(width=.2)


g=ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp))
g
g1=g+geom_boxplot()
g1

g2=g1+geom_point()
g2
g3=g+geom_point()+geom_boxplot()
g3

###colour ----
ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp, colour=golub.factor)) +
  geom_boxplot()+
  geom_point()

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot(aes(colour=golub.factor)) +
  geom_point()

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot() +
  geom_point(aes(colour=golub.factor))

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot(aes(fill=golub.factor)) +
  geom_point()

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot(aes(fill=golub.factor)) +
  geom_point(colour='blue')


ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot(aes(fill=golub.factor)) +
  scale_fill_manual(values=c('red','blue'))+
  geom_point(colour='blue')


ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot(aes(fill=golub.factor)) +
  scale_colour_manual(values=c('red','blue'))+
  geom_point(colour='blue')

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_boxplot(aes(fill=golub.factor),notch=T) +
  geom_point()

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_violin(aes(fill=golub.factor)) +
  geom_jitter(width=.2)+
  xlab('A label')   #change x level


ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_violin(aes(fill=golub.factor)) +
  geom_jitter(width=.2)+
  xlab('A label')+
  ggtitle('A nice plot')  # Title 

ggplot(data=df, aes(x=golub.factor,y=ccnd3_exp)) +
  geom_violin(aes(fill=golub.factor)) +
  geom_jitter(width=.2)+
  ggtitle('A nice plot')+
  theme_bw()


#Day27
## Plot 2 genes ----

golub.gnames[c(829,1042), ]

##Our data not tidy (make tidy) ----
gene_expresion= golub[c(829,1042),]
gene_expresion

as.vector(gene_expresion)
t(gene_expresion)
gene_expresion=as.vector(t(gene_expresion))

cancer_type=rep(golub.factor, times=2)
cancer_type

gene_label = rep(c('CST3', 'CCND3'), each=38)
gene_label

#make data frame

df3=data.frame(gene_expresion, gene_label, cancer_type)
df3  #that is our tidy data

#now plot
ggplot(df3, aes(x=cancer_type, y=gene_expresion)) +
  geom_boxplot(aes(colour=gene_label))

ggplot(df3, aes(x=gene_label, y=gene_expresion)) +
  geom_boxplot(aes(colour=cancer_type))


ggplot(df3, aes(x=gene_label, 
                y=gene_expresion, 
                colour=cancer_type)) +
  geom_violin()+
  geom_jitter(width=.1)


ggplot(df3, aes(x=gene_label, 
                y=gene_expresion)) +
  geom_violin(aes(fill=cancer_type))+
  geom_jitter(width=.1)


ggplot(df3, aes(x=gene_label, 
                y=gene_expresion)) +
  geom_violin(aes(fill=cancer_type))+
  geom_jitter(width=.1)+
  facet_grid(cols=vars(gene_label))  #split grap based on gene label


ggplot(df3, aes(x=cancer_type, 
                y=gene_expresion)) +
  geom_violin(aes(fill=cancer_type))+
  geom_jitter(width=.1)+
  facet_grid(cols=vars(gene_label))   #fill cancer_type


ggplot(df3, aes(x=cancer_type, 
                y=gene_expresion)) +
  geom_violin(aes(fill=gene_label))+
  geom_jitter(width=.1)+
  facet_grid(cols=vars(gene_label))  #fill gene_label



ggplot(df3, aes(x=cancer_type, 
                y=gene_expresion, colour=cancer_type)) +
  geom_violin(aes(fill=cancer_type))+
  geom_jitter(width=.1)+
  facet_grid(cols=vars(gene_label))  #do n't see gene expresssion

ggplot(df3, aes(x=cancer_type, 
                y=gene_expresion, colour=cancer_type)) +
  geom_violin(aes(fill=cancer_type), alpha=.5)+
  geom_jitter(width=.1)+
  facet_grid(cols=vars(gene_label))  #become slightly transparent


ggplot(df3, aes(x=cancer_type, 
                y=gene_expresion, colour=cancer_type)) +
  geom_violin(aes(fill=cancer_type), alpha=0)+
  geom_jitter(width=.1)+
  facet_grid(cols=vars(gene_label)) # fully transparent

ggplot(df3, aes(x=cancer_type, 
                y=gene_expresion, colour=cancer_type)) +
  geom_violin(aes(fill=cancer_type), alpha=.5)+
  geom_jitter(width=.1)+
  facet_grid(cols=vars(gene_label)) +
  ggtitle('my first gene_expression plot')+
  theme_bw()

ggplot(df3, aes(x=cancer_type, 
                y=gene_expresion, colour=cancer_type)) +
  geom_violin(aes(fill=cancer_type), alpha=.1)+
  geom_jitter(width=.1)+
  facet_grid(cols=vars(gene_label)) 

data(iris)

ggplot(data = iris,aes(x = Sepal.Length, y = Petal.Length, colour=Species)) + 
  geom_point()

ggplot(data = iris,aes(x = Sepal.Length, y = Petal.Length, colour=Species)) + 
  geom_point()+
  geom_smoots()

ggplot(data = iris,aes(x = Sepal.Length, y = Petal.Length, colour=Species)) + 
  geom_point()+
  geom_smooth(se=F)

ggplot(data = iris,aes(x = Sepal.Length, y = Petal.Length, colour=Species)) + 
  geom_point(size=4, shape=15, colour='blue')

ggplot(data =iris,aes(x = Sepal.Length)) + 
  geom_bar()

ggplot(data = iris,aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_density_2d_filled()


ggplot(data =iris,aes(x = Sepal.Length, fill=Species)) + 
  geom_histogram()


ggplot(data = iris,aes(x = Sepal.Length, y = Petal.Length, colour=Species)) + 
  geom_point()+
  geom_smooth(se=F)+
  facet_wrap(~Species)


ggplot(data = iris,aes(x = Sepal.Length, y = Petal.Length, colour=Species)) +geom_point() +
  geom_smooth(se=FALSE) + 
  facet_wrap(~Species, scale='free_y') + 
  scale_shape_manual(values=c(3, 16, 17)) +
  scale_size_manual(values=c(2,3,4)) + 
  scale_color_manual(values=c('#669999','#a3c2c2', '#b30059'))

















