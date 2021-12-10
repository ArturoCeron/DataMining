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
The age is compared and if it was bought or not, from this graph it can be rescued that there is a relationship between the age of the person and whether or not they buy. The salary is compared and if it was bought or not. It can be seen in this graph that a high salary is more likely to buy, but this statement can be ambiguous since there are many low-paid individuals who buy.
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

The model can be graphed using our classifier model, we carry out the same procedure as previously carried out by comparing the data and the data arranged for the model. In this graph we can see the comparison between the real data, the line that separates them and later with color to see the prediction made by the model.

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

This case is similar, with the difference that the data we use is test_set and we compare it to the model with the data of train_set
The Result is the following graph, which contains the test data points and the line generated by the trained model.

![Alt text](https://raw.githubusercontent.com/ArturoCeron/DataMining/Unit_3/Unit_3/Practice/Practice_3/Image1.bmp)

![Alt text](https://raw.githubusercontent.com/ArturoCeron/DataMining/Unit_3/Unit_3/Practice/Practice_3/Image2.bmp)
