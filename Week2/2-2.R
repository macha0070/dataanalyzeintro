house2 <- read.csv("../Data/HOUSE_original.csv", row.names = 1)
attach(house2)
plot(Size, Price, cex=0)
text(Size, Price, labels=Address)
class(JR)
plot(Size, Price, col=as.factor(JR), pch=1)
#JRをファクター化している、例を加えるときにlegendを使う
#pchで色選ぶ• JR (0 か 1) のようにカテゴリー化されているものは，データ
#構造が factor であれば as.factor はつけなくて良い
#• 今は，class(JR) を実行すると ”integer” と出るので，factor
#に直してから col に入れるintegerは整数値
legend("topleft", legend=c("JR=0", "JR=1"), pch=1, col=c
       (1,2))
state <- read.csv("../Data/state77.csv", row.names = 1)
attach(state)
head(state)
