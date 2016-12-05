
.libPaths("D:/R code")

library(ape)
library(geiger)
library(nlme)
library(phytools)
library(picante)
library(MASS)


setwd("~/Uni/2016 Session 8/R Script")

#load tree
myo<-read.nexus("nature05634-s2.txt")
mydata <- read.csv("File_name.csv", row.names=1, header=TRUE, sep=",")

myo1<-myo[[1]]

#prune tree
matches<-name.check(myo1,mydata)

pruned<-drop.tip(myo1,matches$tree_not_data)

plot(pruned)

trait_order<-data.frame(mydata[pruned$tip.label,])
rownames(trait_order)<-pruned$tip.label
colnames(trait_order)<-"mass"

#using mass for fun
mass<-as.matrix(trait_order)#head(mass)
mass<-log10(mass)

massV <- mass[,1] #need this step....
contMap(pruned,massV)

XX<-contMap(pruned,massV,res=200, fsize=1.5)
# now plot with type="fan"
plotSimmap(XX$tree,XX$cols,type="fan", fsize=1.1,ftype="i")
add.color.bar(70,cols=XX$cols,title="trait value", lims=range(x),digits=2)

dev.copy2pdf(file="Fig1.pdf", paper="A4r")
