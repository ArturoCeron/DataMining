# Unit_3
# Practice 3
Before starting with the development of the program it is necessary to establish the
working directory and reading the data from the file, this is done with the getwd() directory

``` R
getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos
/DataMining/MachineLearning/LogisticRegression")
getwd()
```
# Importing the dataset
``` R
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]
```
# Splitting data

We must also separate the dataset into 2 parts, one that will work as
training for the model, and another that will work to obtain the accuracy of the
model.

``` R
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
# modeling
We prepare the data by performing a scale, which will help us normalize the data
that are in the data set to generate an index and with this, we prepare a
linear classifier model (General Lineal Regression) specifying the formula, which
is the attribute to look for.
``` R
# Feature scaling
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
# Fitting Logistic Regression to Training set
classifier = glm(formula = Purchased ~ .,
family = binomial,
data = training_set)
```
# training
Having the model, we carry out the training using the test dataset, to
obtain a close-up of our variable, in this case when dealing with regression
logistics, the values ​​must be 1 and 0 so we separate the predictions into
these values ​​using 0.5 as margin. We can generate an array of
confusion (Confusion Matrix) which has the actual values ​​and compares to the
prediction made by the model, implying that of 64 data 0, the
program calculated 67 as 0.
``` R
# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata =
test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
# Making the Confusion Metrix
cm = table(test_set[, 3], y_pred)
cm
 ```
# Visualize the training and testing 
Now we print the graph of the data, for this we are going to compare each of the variables not dependent on the dependent variable, in another way, We will compare each x with our y.
``` R
#
library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) +
geom_point() +
stat_smooth(method="glm", method.args=list(family="binomial"),
se=FALSE)
ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() +
stat_smooth(method="glm", method.args=list(family="binomial"),
se=FALSE)
ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) +
geom_point() +
stat_smooth(method="glm", method.args=list(family="binomial"),
se=FALSE)
ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() +
stat_smooth(method="glm", method.args=list(family="binomial"),
se=FALSE)
 ```
se compara la edad y si se compro o no, de esta grafica se puede rescatar que
existe una relación entre la edad de la persona y si compra o no.
Se compara el salario y si se compro o no.
Se puede observar en esta gráfica que un salario alto tiene más probabilidad de
comprar pero esta declaración puede ser ambigua ya que existen muchos sujetos
de un sueldo bajo que compran.
``` R
# Visualization the Training set result
# install.packages('ElemStatLearn') No work for me,
# manual mode. Go to this URL
https://cran.r-project.org/src/contrib/Archive/ElemStatLearn/
# Download with the latest date 2019-08-12 09:20 12M
# Then follow this page steps
https://riptutorial.com/r/example/5556/install-package-from-localsource
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata =
grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
main = 'Logistic Regression (Training set)',
xlab = 'Age', ylab = 'Estimated Salary',
xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1),
length(X2)), add = TRUE)
points(grid_set, pch = '.', bg = ifelse(y_grid == 1,
'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4',
'red3'))
```

Se puede graficar el modelo utilizando nuestro modelo clasificador, realizamos el
mismo procedimiento realizado anteriormente realizando la comparación entre los
datos y los datos arreglados para el modelo. En esta grafica podemos observar la
comparación entre los datos reales, la línea que los separa y posteriormente con
color para ver la predicción que realiza el modelo.

``` R
# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata =
grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
main = 'Logistic Regression (Test set)',
xlab = 'Age', ylab = 'Estimated Salary',
xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1),
length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1,
'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4',
'red3'))
```

Este caso es similar, con la diferencia de que los datos que utilizamos es test_set y
lo comparamos a el modelo con los datos de train_set
El Resultado es la siguiente grafica, que contiene los puntos de los datos de prueba
y la linea generada por el modelo entrenado.

![Alt text](https://raw.githubusercontent.com/ArturoCeron/DataMining/Unit_3/Unit_3/Practice/Practice_3/Image1.bmp)

![Alt text](https://raw.githubusercontent.com/ArturoCeron/DataMining/Unit_3/Unit_3/Practice/Practice_3/Image2.bmp)
