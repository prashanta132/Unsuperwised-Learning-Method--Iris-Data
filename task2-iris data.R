installed.packages("cluster")
library(dplyr)
library(ggplot2)
library(tidyverse)
install.packages("reshape2")
library(reshape2)
library(readxl)
Iris_1_ <- read_excel("C:/Users/PC/Downloads/Iris (1).xlsx")
View(Iris_1_)
head(Iris_1_)
summary(Iris_1_)
sapply(Iris_1_[,-6],var)
summary(Iris_1_)
str(Iris_1_)
#visualise Sepal Length and width with species
ggplot(Iris_1_,aes(x = SepalLengthCm, y = SepalWidthCm, col= Species)) + geom_point()

#visualise petal Length and width with species
ggplot(Iris_1_,aes(x = PetalLengthCm, y = PetalWidthCm, col= Species)) + geom_point()

#Finding the optimimum number of clusters using Elbow method
head(Iris_1_)
set.seed(200)
k.max <- 10
wss<- sapply(1:k.max,function(k){kmeans(iris[,3:4],k,nstart = 20,iter.max = 20)$tot.withinss})
wss
plot(1:k.max,wss, type= "b", xlab = "Number of clusters(k)", ylab = "Within cluster sum of squares")
#The final cluster model The final model is builtusing kmeans and k = 3
# The nstartvalue has also been defined as 20 which means that R will try 20 different random starting assignments and then select the one with the lowest within cluster variation.
icluster <- kmeans(Iris_1_[,3:4],3,nstart = 20)
table(icluster$cluster,Iris_1_$Species)

