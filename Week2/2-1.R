house <- read.csv("../Data/HOUSE_original.csv", row.names = 1)
head(house)
house$Price#ここでPriceを呼ぶ
house$Size


hist(Price, main="")
hist(Price, breaks=seq(0,8000,by=500), main="")

hist(Price)$breaks
hist(Price)$counts
colors()
hist(Price, col=2)
hist(Size, col="blue")
hist(Age, border="white")
summary(house)
boxplot(Price, xlab="Price")
boxplot(Size, Area, horizontal=T, names=c("Size","Area"))


text(Size, Price, labels=rownames(house))
house2 <- read.csv("../Data/HOUSE_original.csv", row.names = 1)
attach(house2)
plot(Size, Price, cex=0)
text(Size, Price, labels=Address)
