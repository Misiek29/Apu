library("C50")

setwd("F:/MAGAZYN/ATH/MAGISTERKA/Uczenie maszynowe/Repo/Lab4")
dane <- read.csv('pralki.csv')
dane$Ocena <- factor(dane$Ocena)
head(dane)
treeModel1 <- C5.0(x=dane[,-6], y=dane$Ocena)
treeModel1
summary(treeModel1)
plot(treeModel1)

