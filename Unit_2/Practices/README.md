# Practice 1

1. Buscar una fuente de datos con formato csv(Tema libre)
2. Leer el csv y analizar los datos con R 
3. Generar tres gráficas con R que cuente la historia de los datos, la primera que sea una gráfica de dispersión de puntos, la segunda que sea una gráfica en facetas y la tercera una gráfica que nos diga algo estadístico como la distribución que tienen los datos y que contenga la capa temas (theme). 

First we have to define our dataset and we can make a summary.
``` R
setwd("C:/Users/CORSAIR/DataMining/Unit_2/Practices")
carValues <- read.csv("cars.csv", sep=";")

head(carValues)
colnames(carValues)
tail(carValues)
str(carValues)
summary(carValues)
```

Next we have to import the ggplot2 library so we can make any kind of plot we need.
``` R
library(ggplot2)
```

# ScatterPlot

Using the ggplot2 library we can use the ggplot function to define the data and the aesthetic we want to use, and using the geom_point function we declare the layer of what kind of plot we are going to use. 
``` R
#Scatter Plot Graphic
ggplot(carValues, aes(x=Horsepower, y=Acceleration, 
                   color=Origin, size=Cylinders)) + 
  geom_point()
 ```

![Alt text](ScatterPlot.PNG?raw=true)

<hr></hr>

# Facets

Another way to use layers is using a variable that can be used with any layer in this case we use geom_histogram which can be used to plot a histogram.
 ``` R
#Facets number of times a car has that amount of horsepower
facett <- ggplot(carValues, aes(x=Horsepower))
facett + geom_histogram(binwidth = 10, aes(fill=Origin),
                   color="Black") + facet_grid(Origin~., scales="free")
```

![Alt text](Facets.PNG?raw=true)

<hr></hr>

# Theme

Also we can save all the process in a variable which can be called any time anywhere in the code.
``` R
#theme, number of times a car has the same displacement ordered by Region
o <- ggplot(carValues, aes(x=Displacement))
h <- o + geom_histogram(binwidth = 10, aes(fill=Origin), color="Black")
h
```

![Alt text](Theme.PNG?raw=true)