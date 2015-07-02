library(ggplot2)
library(reshape2)

plotTimes = function(data) {
  qplot(numberOfPoints, timeInSeconds, data = data,
        geom = c("point", "line"), color = dim,
        main = "Quick Hull - calculation time over number of points",
        xlab = "number of points", ylab = "time in seconds")
}

data = read.table("times.txt", header = TRUE)
data = transform(data, dim = factor(dimension))
data
head(data)
str(data)

acast(data, dimension ~ numberOfPoints, value.var = "time")

dimensionBreak = 5
# alles andere ist schlecht, weil man dann die einzelnen linien
# nicht mehr sieht (was köster letztes mal kritisiert hat)
# also hinweis darauf, dass die diagramme unterschiedliche skalen haben

plotTimes(subset(data, dimension < dimensionBreak))
plotTimes(subset(data, dimension >= dimensionBreak))
