am<-read.csv("../Data/auto-mpg.csv")
mpg<-am$mpg
cyl<-am$cylinders
ds<-am$displacement
hp<-am$horsepower
kg<-am$weight
acl<-am$acceleration
year<-am$model.year
origin<-am$origin
name<-am$car.name
data <- read.csv("../Data/auto-mpg.csv")
summary(data)
# 数値データのみを選択TRUE の列だけを選択し
#新しいデータフレームnumeric_data作成
numeric_data <- data[, sapply(data, is.numeric)]
cor(numeric_data)
install.packages("corrplot")
library(corrplot)
corrplot(cor(numeric_data))

# 原産地ごとのボックスプロット
par(mfrow=c(1,3))
boxplot(mpg ~ origin, data=data, main="MPG by Origin", xlab="Origin", ylab="MPG", col=c("red", "blue", "green"))
boxplot(weight ~ origin, data=data, main="Weight by Origin", xlab="Origin", ylab="Weight", col=c("red", "blue", "green"))
boxplot(horsepower ~ origin, data=data, main="horsepower by Origin", xlab="Origin", ylab="horsepower", col=c("red", "blue", "green"))

pairs(numeric_data, col = as.factor(am$origin), pch = 20)
selected_data <- am[, c("cylinders", "acceleration")]
pairs(selected_data, col = as.factor(am$origin), pch = 20)
plot(mpg,kg,col = as.factor(am$origin), pch = 20)
cor(numeric_data, use = "complete.obs")

#重回帰分析を
fit<-lm(mpg~cyl+ds+hp+kg+acl+year+origin,data=am)
summary(fit)
par(mfrow=c(1,2))
plot(fit,which=1:2,pch =20)

summary(fit)$coef
confint(fit)
AIC(fit)
fit2 <- lm(mpg ~ hp + kg + year + origin, data = am)
AIC(fit2)

fit.null <- lm(mpg~1, data=am)
fit.full <-lm(mpg~cyl+ds+hp+kg+acl+year+origin,data=am)
step(fit.null, list(lower=fit.null, upper=fit.full))
step(fit.full, list(lower=fit.null, upper=fit.full))
step(fit, direction="both")

