library(lattice)
cloud(Petal.Length ~ Sepal.Length * Sepal.Width, data = iris, groups = Species)



data <- read.csv("../Data/HOUSE.csv",row.names = 1)
Price <- data$Price; Period <- data$Period
Area <- data$Area
Size <- data$Size
JR <- data$JR 
St.time <- data$St.time
Age <- data$Age
Distance <- data$Distance
#重回帰分析
fit <- lm(Price ~ Period + Area + Size + JR + St.time
          + Age + Distance, data = data)
#summaryのestimateの値は変数が１増えたときに
#どのくらいの数値（Price）が変化するのかを書いている
summary(fit)
cor(data)
par(mfrow=c(1,2))
plot(fit,which=1:2,pch=20)
par(mfrow=c(1,1))
summary(fit)$coef
confint(fit)
fit3<-lm(Price~Period+Size+Area+JR+St.time)
AIC(fit3)