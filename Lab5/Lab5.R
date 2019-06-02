library("C50")
library(MASS)

data(biopsy)
head(biopsy)
treeModel3 <- C5.0(x=biopsy[,-11], y=biopsy$class)
treeModel3
summary(treeModel3)
plot(treeModel3)
