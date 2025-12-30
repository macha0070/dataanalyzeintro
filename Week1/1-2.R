6/9
x.data<-c(1,4,7,2,5,8,3,6,9)
sort(x.data)
length(x.data)
max(x.data)
mean(x.data)
var(x.data)

n=0
v=0
for (number in x.data){
  v<-v+(number-5)^2
  print(v)
  bun=v/length(x.data)
  print(v/bun)
  print(number)
}
print(v)
print(length(x.data))
print(bun)

A<-c(1,2,3,4,5,6)
b<-matrix(A,nrow=2,ncol=3)
matrix(A,nrow = 2,ncol = 3, byrow = T)
b[1,2]
b[2,]
b[,3]
b[,-3]
diag(3)

C<-c(3,5,1,8,4,7,2,8,1)
c<matrix(C, nrow = 3, ncol = 3)
D<-c(2,87,1,6,9,3,5,8,3)
c<-matrix(D, nrow = 3, ncol = 3)
C[,2]
