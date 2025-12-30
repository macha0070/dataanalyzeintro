kyphosis <- read.csv(file ="Data/kyphosis.csv", row.names= 1)
attach(kyphosis)
Kyphosis
name <- c("present", "absent")
boxplot(Age[Kyphosis=="present"],Age[Kyphosis=="absent"],main="Age", names=name)
boxplot(Number[Kyphosis=="present"],Number[Kyphosis=="absent"],main="Number",names=name)
boxplot(Start[Kyphosis=="present"],Start[Kyphosis=="absent"],main="Start",names=name)
fit <- glm(factor(Kyphosis)~Age+Number+Start, family=
             "binomial", data=kyphosis)
summary(fit)
fit.null <- glm(Kyphosis~1, family="binomial")
fit.full <- glm(Kyphosis~Age+Number+Start, family="
binomial")
aic.null <- step(fit.null, list(lower=fit.null, upper
                                =fit.full))
aic.full <- step(fit.full, list(lower=fit.null, upper
                                =fit.full))
