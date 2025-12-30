
baby<-read.csv("../Data/NeoWeight.csv",row.names = 1)
Weight<-baby$Weight
MWeight<-baby$MWeight
MAge<-baby$MAge
Period<-baby$Period
Smoking<-baby$Smoking
fit<-lm(Weight ~MWeight +MAge+Period+Smoking , data=baby)
summary(fit)

cor(baby)
par(mfrow=c(1,2))
plot(fit,which=1:2,pch=20)
#上記は（１）の回答である

par(mfrow=c(1,1))
summary(fit)$coef
confint(fit)
# 回帰係数の検定において，有意水準 5%で有意となった説明
#変数を答えよ:MWeight,MAge,Period

AIC(fit)
fit.null<-lm(Weight~1,data=baby)
fit.full<-lm(Weight~.,data=baby)
step(fit.null,list(lower=fit.null,upper=fit.full))
step(fit.full,list(lower=fit.null,upper=fit.full))

#(3) どの説明変数の組み合わせが最適化を変数増減法を用いて求
#めよ


