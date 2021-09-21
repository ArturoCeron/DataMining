# 1 Crear una lista
lista <- list("Arturo", "Ariel", "Jose")

# 2 Total de numeros desplegados, el ultimo digito se redondea
result <- format(23.123456789, digits = 9)
print(result)

# 3 Regresa la cantidad de caracteres de una cadena (incluyendo espacios)
result <- nchar("Count the number of characters")
print(result)

# 4 Cambia la cadena a mayusculas
result <- toupper("Changing To Upper")
print(result)

# 5 Cambia la cadena a minusculas
result <- tolower("Changing To Lower")
print(result)

# 6 Extraer parte de una cadena
result <- substring("Extract", 5, 7)
print(result)

# 7 Crear una grafica de pastel

  # Create data for the graph.
x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")
  # Plot the chart.
pie(x,labels)


# 8 Crear una grafica de barras

  # Create the data for the chart
H <- c(7,12,28,3,41)

  # Plot the bar chart 
barplot(H)

# 9 Crear una grafica de tipo boxplot

input <- mtcars[,c('mpg','cyl')]
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")

# 10 Crear una grafica de tipo Histograma

# Create data for the graph.
v <-  c(9,13,21,8,36,22,12,41,31,33,19)
# Create the histogram.
hist(v,xlab = "Weight",col = "yellow",border = "blue")

# 11 Crear una grafica lineal

# Create the data for the chart.
v <- c(7,12,28,3,41)

# Plot the bar chart. 
plot(v,type = "o")

# 12 Crear una grafica de tipo ScatterPlot

input <- mtcars[,c('wt','mpg')]
# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15 and 30.
plot(x = input$wt,y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(2.5,5),
     ylim = c(15,30),		 
     main = "Weight vs Milage"
)

# 13 Obtener la media

# Create a vector. 
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)

# Find Mean.
result.mean <- mean(x)
print(result.mean)

# 14 Remover valores de una lista ordenada con Trim

# Create a vector.
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)

# Find Mean.
result.mean <-  mean(x,trim = 0.3)
print(result.mean)

# 15 Obtener mediana
# Create the vector.
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)

# Find the median.
median.result <- median(x)
print(median.result)

# 16 divide una cadena acorde a un separador

x <- c("asfef","qwerty")
# split x on the letter e
strsplit(x, "e")

# 17 Retorna el valor absoluto del valor que se le ingrese

abs(-18)

# 18 Regresa el factorial de un valor
factorial(6)

# 19 Regresa el logaritme de un valor con una base especificada
log(16,base=2)

# 20 Redondear valores
ceiling(1.4) #Redoea hacia arriba

floor(1.4) #Redondea hacia abajo




















