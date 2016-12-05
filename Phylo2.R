
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

trait_order<-mydata[pruned$tip.label,]

#using SVL for fun
svl<-as.matrix(trait_order$mass)
svl<-log10(svl)
rownames(svl)<- pruned$tip.label
svlV <- svl[,1]
contMap(pruned,svlV)
XX<-contMap(pruned,svlV,res=200, fsize=0.9)
# now plot with type="fan"
plotSimmap(XX$tree,XX$cols,type="fan", fsize=0.4)
add.color.bar(70,cols=XX$cols,title="trait value", lims=range(x),digits=2)

dev.copy2pdf(file="Fig1.pdf", paper="A4r")
