#(1) x 軸を Population，y 軸を Income とした散布図を州の名前を
#プロットする形で作成せよ
#(2) x 軸を Murder，y 軸を Life.Exp とした散布図を HS.grad が 50
#より小さいか否かで色分けしてプロットせよ
#(3) その他のことも色々と試し（やったことは R のスクリプトに
#書いておくこと）このデータからどんなことがわかるかを 2
#つ以上かけ．必要に応じて # でコメントも書くこと
#(2) のヒント：HS.Grad<50 で HS.grad が 50 より小さいか否かの
#真偽が確認できる
state <- read.csv("../Data/state77.csv", row.names = 1)
attach(state)
#(1)
plot(Population, Income)
#(2)
plot(Murder, Life.Exp, col=as.factor(HS.Grad<50), pch=1)
legend("topleft", legend=c("HS.Grad<50", "HS.Grad>=50"), pch=1, col=c
       (1,2))

#(3)
#次に回帰直線を授業内のやり方で書いてみる
x<-state$Population
y<-state$Income
beta.hat<-cov(x,y)/var(x)
alpha.hat<-mean(y)-beta.hat*mean(x)

beta.hat
alpha.hat

cor(x,y)

plot(x,y,xlab="Income",ylab="Population",pch=16,cex=0.5)
abline(alpha.hat,beta.hat,col=2,lwd=3)
alpha.hat+beta.hat
#このデータから回帰直線が分かる
#また相関係数からこのデータには相関があまりなくグラフからもわかる