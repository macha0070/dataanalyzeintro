data<-read.csv("deug.csv",row.names=1)
dist(data)
hc<-hclust(dist(data))
plot(hc,hang=-1)
rect.hclust(hc,k=3,border=2)

moon<-read.csv("two_moon.csv",row.names = 1)


iris
km <- kmeans(iris[,-5], center=3, nstart=50)
km$cluster
pairs(iris[,-5], col=km$cluster)

pca<-prcomp(iris[,-5],scale=TRUE)#主成分分析
summary(pca)

pc1<-pca$x[,1]#第一主成分得点
pc2<-pca$x[,2]#第二主成分得点
plot(pc1,pc2,cex=0)#第一と第二のプロット

text(pc1,pc2,labels=iris[,5],col=km$cluster)



#演習
USArrests
us<-hclust(dist(USArrests),method = "average")
plot(us)
rect.hclust(us,k=3,border=5)



