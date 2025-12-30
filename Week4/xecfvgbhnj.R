data<-read.csv("../Data/THE2024.csv" ,row.names = 1)
head(data)


pairs(data[,c(4,5,6,7,8,9)])
summary(data)#ようやく統計量
cor(data[,c(4,5,6,7,8,9)])#相関係数



pca <- prcomp(data[-c(1,2,3)], scale=TRUE)
pc1<-pca$x[,1]
pc2<-pca$x[,2]
plot(pc1,pc2,cex=0)
text(pc1,pc2,labels=rownames(data))
biplot(pca)

km <- kmeans(data[,-c(1,2,3)], center=3, nstart=50)
km$cluster
pairs(data[,-c(1,2,3)], col=km$cluster)

hist(data[,c(6)], col=2)



data<-read.csv("../Data/THE2024.csv" ,row.names = 1)
head(data)


pairs(data[,c(4,5,6,7,8,9)])

summary(data)#ようやく統計量

cor(data[,c(4,5,6,7,8,9)])#相関係数

data<-read.csv("../Data/THE2024.csv" ,row.names = 1)
head(data)

hc<-hclust(dist(data))
plot(hc)
rect.hclust(hc,k=4, border=4)
data<-read.csv("../Data/THE2024.csv" ,row.names = 1)
head(data)

head(data)
hc<-hclust(dist(data[,-c(1,2,3)]))
plot(hc,labels=data[,3])

