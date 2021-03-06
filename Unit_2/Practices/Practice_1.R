setwd("C:/Users/CORSAIR/DataMining/Unit_2/Practices")
carValues <- read.csv("cars.csv", sep=";")

head(carValues)
colnames(carValues)
tail(carValues)
str(carValues)
summary(carValues)

library(ggplot2)

#Scatter Plot Graphic
ggplot(carValues, aes(x=Horsepower, y=Acceleration, 
                   color=Origin, size=Cylinders)) + 
  geom_point()
 
#Facets number of times a car has that amount of horsepower
facett <- ggplot(carValues, aes(x=Horsepower))
facett + geom_histogram(binwidth = 10, aes(fill=Origin),
                   color="Black") + facet_grid(Origin~., scales="free")

#theme, number of times a car has the same displacement ordered by Region
o <- ggplot(carValues, aes(x=Displacement))
h <- o + geom_histogram(binwidth = 10, aes(fill=Origin), color="Black")
h