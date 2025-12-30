house <- read.csv("../Data/HOUSE.csv", row.names = 1)
attach(house)
fit1 <- lm(Price~poly(Size,1))
fit5 <- lm(Price~poly(Size,5))
fit3 <- lm(Price~poly(Size,3))

summary(fit3)
xx <- seq(min(Size),max(Size),length=500)
plot(Size,Price)
lines(xx,predict(fit3,data.frame(Size=xx)))
plot(Size,Price)
lines(xx,predict(fit1,data.frame(Size=xx)),col=1)
lines(xx,predict(fit3,data.frame(Size=xx)),col=2)
lines(xx,predict(fit5,data.frame(Size=xx)),col=3)
legend("topleft",legend=c("q=1","q=3","q=5"),lty=1,
       col=1:3)
cars
# Assign variables from the cars dataset
dist.cars <- cars$dist
speed.cars <- cars$speed
# Fit polynomial regression models
fiit2 <- lm(dist.cars ~ poly(speed.cars, 2))
fiit3 <- lm(dist.cars ~ poly(speed.cars, 3))
fiit4 <- lm(dist.cars ~ poly(speed.cars, 4))
fiit5 <- lm(dist.cars ~ poly(speed.cars, 5))
fiit11 <- lm(dist.cars ~ poly(speed.cars, 11))
# Summarize the quadratic model
summary(fiit2)
# Plot the data
plot(speed.cars, dist.cars, main = "Polynomial Regression Fits",
     xlab = "Speed", ylab = "Distance", pch = 19, col = "blue")
# Sequence for prediction
ds <- seq(min(speed.cars), max(speed.cars), length = 100)
# Add fitted lines to the plot
lines(ds, predict(fiit2, data.frame(speed.cars = ds)), col = 1, lwd = 2)
lines(ds, predict(fiit3, data.frame(speed.cars = ds)), col = 2, lwd = 2)
lines(ds, predict(fiit4, data.frame(speed.cars = ds)), col = 3, lwd = 2)
lines(ds, predict(fiit5, data.frame(speed.cars = ds)), col = 4, lwd = 2)
lines(ds, predict(fiit11, data.frame(speed.cars = ds)), col = 7, lwd = 2)
# Add a legend
legend("topright", legend = c("Degree 2", "Degree 3", "Degree 4", "Degree 5", "Degree 11"),
       col = c(1, 2, 3, 4, 7), lty = 1, lwd = 2, bty = "n")

