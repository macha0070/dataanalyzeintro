kenshin <- read.csv("../Data/kenshin.csv")
A <- subset(kenshin$bp, kenshin$type=="A")
B <- subset(kenshin$bp, kenshin$type=="B")

# データが正規分布にしたがっているのか？
hist(A)
hist(B)
# 正規性はまあOK

# 二つのグループの分散が等しいのか？（等分散性）
boxplot(A,B, names=c("A","B"))
var(A)
var(B)
var.test(A, B) # 等分散性の検定（H0: A地区とB地区の分散が等しい）
# p-value = 0.2825 > 0.05（H0は棄却されない）
# 等分散性は OK

# 二標本検定（H0: A地区とB地区の平均値が等しい）
t.test(A, B, var.equal = TRUE)
# p-value が有意水準0.05よりも小さければH0仮説棄却
# p-value = 0.02101 < 0.05
# --> H0を棄却!!

#########################
# メモ（補足）
# subset(kenshin$bp, kenshin$type=="A" | kenshin$type=="B")
# & かつ # | または
#########################

# 等分散性がない場合（等分散のケースでも使える）
t.test(A, B, var.equal = FALSE)
t.test(A, B)
# p-value = 0.02863 < 0.05 --> H0棄却!

# 演習1
x <- c(8.4, 9.4, 7.7, 9.4, 7.8, 8.6, 8.9, 8.2, 9.6, 8.8)
y <- c(7.3, 8.1, 7.7, 6.4, 6.8, 7.2, 7.8, 9.0)

# 正規性の確認
hist(x)
hist(y)

# 等分散性の確認
boxplot(x,y)
var.test(x, y)
# p-value = 0.5798 > 0.05 --> 棄却しない

t.test(x, y, alternative = "greater", var.equal = TRUE) # mu1 > mu2
# p-value = 0.002288 < 0.05 --> H0棄却
t.test(x, y, var.equal = TRUE) # mu1 not equal mu2
# p-value = 0.004577 < 0.05 --> H0棄却
t.test(x, y, alternative = "less", var.equal = TRUE) # mu1 < mu2
# p-value = 0.9977 > 0.05 --> H0を棄却しない

# 演習2（対応のあるデータ）
before <- c(0.7, -1.6, -0.2, -1.2, -0.1, 3.4, 3.7, 0.8, 0, 2)
after <- c(1.9, 0.8, 1.1, 0.1, -0.1, 4.4, 5.5, 1.6, 4.6, 3.4)

# 正規性の確認
hist(before)
hist(after)

# 等分散性の確認
boxplot(before, after)
var.test(before, after)
# p-value = 0.7427 > 0.05 --> H0を棄却できない

t.test(before, after, alternative = "greater", var.equal = TRUE, paired = TRUE) # before>after
t.test(before, after, var.equal = TRUE, paired = TRUE)
t.test(before, after, alternative = "less", var.equal = TRUE, paired = TRUE) # before<after


#####################################
# 相関係数の検定
# H0: 相関係数が0

blood <- read.csv("../Data/bloodpre.csv")
blood

# 正規性の確認
hist(blood$age)
hist(blood$bp)

plot(blood$age, blood$bp, pch=16, cex=2)
cor(blood$age, blood$bp) # 0.5161209

cor.test(blood$age, blood$bp)
# p-value = 0.01661 < 0.05 --> H0を棄却!!

blood[21,2] <- 507 # 外れ値を入れた
plot(blood$age, blood$bp, pch=16, cex=2)
cor(blood$age, blood$bp)
# spearmanは正規性が成り立っていなくても使える
cor.test(blood$age, blood$bp)
cor.test(blood$age, blood$bp, method="spearman")

########## 
# 分散分析
medicine <- read.csv("../Data/medicine.csv")
bp <- medicine$bp # 血圧
type <- factor(medicine$type) # 治療の薬の種類（因子）
class(type)

# 実行
# H0: A=B=P
res <- aov(bp~type) # analysis of variance (aov)
summary(res)
# p-value = 0.000357 < 0.05 --> H0は棄却


# 演習（p.66）
iris
Sepal.Length <- iris$Sepal.Length
class(iris$Species) # Rにでデフォルトで入っているデータはfactor化されていることが多い
Species <- iris$Species

SL.setosa <- subset(Sepal.Length, iris$Species=="setosa")
SL.versicolor <- subset(Sepal.Length, iris$Species=="versicolor")
SL.virginica <- subset(Sepal.Length, iris$Species=="virginica")

boxplot(SL.setosa, SL.versicolor, SL.virginica)

res <- aov(Sepal.Length ~ Species) # 3つの種類の花のガクの長さの平均値が同じであるかどうかを検定
summary(res)
# p-value = 2e-16 = 2×10^(-16)  < 0.05  -->  H0は棄却

colnames(iris)
Sepal.Width <- iris$Sepal.Width
Petal.Length <- iris$Petal.Length
Petal.Width <- iris$Petal.Width

res2 <- aov(Sepal.Width ~ Species)
summary(res2)

res3 <- aov(Petal.Width ~ Species)
summary(res3)

res4 <- aov(Petal.Length ~ Species)
summary(res4)
