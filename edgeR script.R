# installation

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.12"
                     
                     
                     if (!requireNamespace("BiocManager", quietly = TRUE))
                       install.packages("BiocManager")
                     BiocManager::insta
 
 #install data
 # Download example file "mobData.RData" using the link http://web.stanford.edu/class/bios221...                    
                                         
#install edgeR
BiocManager::install ("edgeR")
 library(edgeR)
                     
# set directory
setwd("/Users/user/Desktop/expression analysis/deseq2")
load("mobData.RData")
head(mobData)

mobDataGroups<-c("MM", "MM", "WM", "WM", "WW", "WW")

# MM="triple mutatnt shoot grafted onto triple mutant root"
# WM="wild-type shoot grafted onto triple mutant root"
# WW="wild-type shoot grafted onto wild-type root"

data <- read.table("mobAnnotation.txt", header = TRUE, sep = "\t")
d <- DGEList(counts=mobData,group=factor(mobDataGroups))
d
#Filtering the data
dim(d)
d.full <- d
# keep the old one in case we mess up
head(d$counts)
head(cpm(d))
apply(d$counts, 2, sum) # total gene counts per sample
keep <- rowSums(cpm(d) > 100) >= 2
d <- d[keep,]
dim(d)
d$samples$lib.size <- colSums(d$counts)
d$samples

#Normalizing the data
d <- calcNormFactors(d)
d
#Data Exploration
plotMDS(d, method="bcv", col=as.numeric(d$samples$group))
legend("bottomleft", as.character(unique(d$samples$group)), col=1:3, pch=20)

#Estimating the Dispersion
d1 <- estimateCommonDisp(d, verbose=T)
names(d1)

d1 <- estimateTagwiseDisp(d1)
names(d1)
plotBCV(d1)

#GLM estimates of dispersion

design.mat <-model.matrix(~ 0 + d$samples$group)
colnames(design.mat) <- levels(d$samples$group)
d2 <- estimateGLMCommonDisp(d,design.mat)
d2 <- estimateGLMTrendedDisp(d2,design.mat, method="power")
# You can change method to "auto", "bin.spline", "power", "spline", "bin.loess".
# The default is "auto" which chooses "bin.spline" when (write "greater than" sign here) 200 tags and "power" otherwise.
d2 <- estimateGLMTagwiseDisp(d2,design.mat)
plotBCV(d2)

Differential Expression

et12 <- exactTest(d1, pair=c(1,2)) # compare groups 1 and 2
et13 <- exactTest(d1, pair=c(1,3)) # compare groups 1 and 3
et23 <- exactTest(d1, pair=c(2,3)) # compare groups 2 and 3
topTags(et12, n=10)

de1 <- decideTestsDGE(et12, adjust.method="BH", p.value=0.05)
summary(de1)
de1tags12 <- rownames(d1)[as.logical(de1)] 
plotSmear(et12, de.tags=de1tags12)
abline(h = c(-2, 2), col = "blue")
