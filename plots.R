library(ggplot2)
library(reshape2)

data = read.table("test-times.txt", header = TRUE)
data
str(data)
datam = melt(data, id = "d")
datam = transform(datam, dims = factor(d))

qplot(variable, value, data = datam, geom = c("point", "line"), color = dims)