#ファイル読み込む
penguins<-read.csv("penguins.csv")
cl <- penguins$culmen_length_mm
sp<-penguins$species
#くちばしの長さを取り出す
A.cl<-subset(penguins$culmen_length_mm,penguins$species=="Adelie")
C.cl<-subset(penguins$culmen_length_mm,penguins$species=="Chinstrap")
G.cl<-subset(penguins$culmen_length_mm,penguins$species=="Gentoo")
#ボックスプロットする
boxplot(A.cl,C.cl,G.cl, names=c("Adelie.cl","Chinstrap.cl","Gentoo.cl"))
# 分散検定を用いてH0: A.cl=C.cl=G.cl
res<-aov(cl ~ sp)
summary(res)
# 3つの種類のペンギン嘴の長さの平均値が同じであるかどうかを分散分析して検定
# p-value = 2e-16 = 2×10^(-16)  < 0.05  -->  H0は棄却域にあるため棄却

#くちばしの深さを取り出す
dp <- penguins$culmen_depth_mm
sp<-penguins$species
A.dp<-subset(penguins$culmen_depth_mm,penguins$species=="Adelie")
C.dp<-subset(penguins$culmen_depth_mm,penguins$species=="Chinstrap")
G.dp<-subset(penguins$culmen_depth_mm,penguins$species=="Gentoo")
boxplot(A.dp,C.dp,G.dp, names=c("Adelie.dp","Chinstrap.dp","Gentoo.dp"))

#深さと長さのそれぞれのプロット
plot(A.cl, A.dp, pch=16, cex=1)
plot(C.cl, C.dp, pch=16, cex=1)
plot(G.cl, G.dp, pch=16, cex=1)

# 相関係数の検定
# H0: 相関係数が0
cor(A.cl, A.dp) #0.3858132
cor(C.cl, C.dp) #0.6535362
cor(G.cl, G.dp) #0.6540233
cor.test(A.cl, A.dp)#p-value = 1.515e-06
cor.test(C.cl, C.dp)#p-value = 1.526e-09
cor.test(G.cl, G.dp)#p-value = 7.337e-16
# p-value =  < 0.05 --> H0を棄却


#２標本検定subsetを使ってsexとbody_mass_gを絞り込む
m.mg<-subset(penguins$body_mass_g,penguins$species=="Gentoo"&penguins$sex=="MALE")
f.mg<-subset(penguins$body_mass_g,penguins$species=="Gentoo"&penguins$sex=="FEMALE")
#m.mg,f.mgをそれぞれ検定
t.test(m.mg, f.mg, alternative = "greater", var.equal = TRUE) # mu1 > mu2
# p-value < 2.2e-16 < 0.05 --> H0棄却
t.test(m.mg, f.mg, var.equal = TRUE) # mu1 not equal mu2
# p-value < 2.2e-16 < 0.05 --> H0棄却
t.test(m.mg, f.mg, alternative = "less", var.equal = TRUE) # mu1 < mu2
# p-value = 1 > 0.05 --> H0を棄却しない
#このためm.mg<f.mgは棄却できない




