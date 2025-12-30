
data<-read.csv("../Data/deug.csv",row.names=1)
head(data)
pca<-prcomp(data,scale=TRUE)#主成分分析
pca$rotation # 主成分負荷量（主成分係数）ベクトルを表す
pca$x # 主成分得点
summary(pca) # 標準偏差，寄与率，累積寄与率
plot(pca) # 寄与率のプロット
biplot(pca)#baiプロットこの場合だとベクトルの方向に向かえば向かうほどそのスコアがよい人となる


pc1<-pca$x[,1]#第一主成分得点
pc2<-pca$x[,2]#第二主成分得点
plot(pc1,pc2)#第一と第二のプロット


#演習オリンピックのやつ
oly<- read.csv("../Data/olympic.csv")
opa<-prcomp(oly,scale=TRUE)#主成分分析
summary(opa) # 標準偏差，寄与率，累積寄与率
opa$rotation# 主成分負荷量
biplot(opa)
#第一主成分(pc1)は主成分係数の富豪がすべて
#同じであると言えるので総合的な成績を
#表していると言える（小さければ成績いい）
#上側のほうは瞬発系スタミナ系
#下側のベクトルはパワー系である。



