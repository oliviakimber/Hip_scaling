
####THIS ONE!!! 
install.packages("imager")

library(imager)
setwd("/Volumes/NO NAME/olivia hip height")
Name <- read.csv("File_name2.csv")
name <- levels(Name$Fname)

kk = 1 # start species
yy = 1 # end species

# set working directory
for (jj in kk:yy){
setwd(paste0("/Volumes/NO NAME/olivia hip height","/",name[jj]))
filenames <- (Sys.glob("*.jpg"))

cvalues= matrix(nrow = 0, ncol = 22)
colnames(cvalues)<-c('name', 'image','hx1','hx2','hx3','hx4', 'hx5','hy1','hy2','hy3','hy4', 'hy5','fx1','fx2','fx3','fx4', 'fx5','fy1','fy2','fy3','fy4', 'fy5')


#run this for loop 
for (ii in 1:length(filenames)){
im <- load.image(filenames[ii])
plot(im, asp=1, axes = F)
#hindlimbs
Hcalpoints <- locator(n=5,type='p',pch=4,col='blue',lwd=2)
#forelimbs
Fcalpoints <- locator(n=5,type='p',pch=4,col='red',lwd=2)
temp<-c(name[jj],filenames[ii],Hcalpoints$x,Hcalpoints$y,Fcalpoints$x,Fcalpoints$y)
cvalues<-rbind(cvalues,temp)
}



#this line write to excel file - will add on to an existing excel file
write.table(cvalues,"outdata.csv", append = T, row.names=F,na="NA",quote= FALSE, sep=",", col.names=T)
}
