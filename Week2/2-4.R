house <- read.csv("../Data/HOUSE.csv", row.names = 1)
Size <- house$Size
Price <- house$Price
cor(Size,Price) # Size とPrice の相関係数
cov(Size, Price) # Size とPrice の共分散
cor(house) # 全ての変数の相関係数行列
fit=lm(Price~Size,data=house)
fit$coefficients
#最小二乗推定値の計算↑
x<-house$Size
y<-house$Price
beta.hat<-cov(x,y)/var(x)
alpha.hat<-mean(y)-beta.hat*mean(x)

beta.hat
alpha.hat

plot(x,y,xlab="Size",ylab="Price",pch=16,cex=0.5)
abline(alpha.hat,beta.hat,col=2,lwd=3)
alpha.hat+beta.hat*300

