library("neuralnet")

output <- as.data.frame(runif(50, min = 1, max = 3))
input <- cos(output^2) + output

trainingData <- cbind(input, output)
colnames(trainingData) <- c("Input", "Output")

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
maxmindf <- as.data.frame(lapply(trainingData, normalize))

net.price <- neuralnet(Output~Input, maxmindf, hidden = c(5, 6, 3), threshold = 0.001)

plot(net.price)

