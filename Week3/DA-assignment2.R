#(1)k=2,3でクラスタリング 
km2 <- kmeans(USArrests[,-5], center=2, nstart=50)
km2$cluster
pairs(USArrests[,-5], col=km2$cluster)

km3 <- kmeans(USArrests[,-5], center=3, nstart=50)
km3$cluster
pairs(USArrests[,-5], col=km3$cluster)


#(2)主成分分析、クラスターごとに色分け
usa<-prcomp(USArrests,scale=TRUE)#主成分分析

pc1<-usa$x[,1]
pc2<-usa$x[,2]
plot(pc1,pc2)
plot(pc1,pc2,cex=0)
plot(pc1,pc2,col = km2$cluster)
plot(pc1,pc2,cex=0)
plot(pc1,pc2,col = km3$cluster)


#(3) 州の名前を表示
plot(pc1,pc2,cex=0)
text(pc1,pc2,labels=rownames(USArrests),col = km2$cluster)

plot(pc1,pc2,cex=0)
text(pc1,pc2,labels=rownames(USArrests),col = km3$cluster)
