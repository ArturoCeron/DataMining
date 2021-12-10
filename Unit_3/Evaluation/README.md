# Unit_3


# Reading data
In this step, the csv file is imported from where the data will be obtained.
Since there is data such as gender and user id, we can shrink the dataset.
``` R
# Support Vector Machine (SVM)
# Set our workspace
getwd()
setwd("C:/Users/CORSAIR/DataminingRomero/DataMining/MachineLearning/naiveBayes")
getwd()
# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

# Data cleaning

The data is partially clean, so the only thing to do is to separate the data set into training data for the model and test data to evaluate the model later.
``` R
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
``` 

we take our dependent variable and categorize it.
``` R
# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

We perform a scaling so that we can work with similar data.
``` R
# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
``` 

# Generate Model
To start working with our model, the first thing we must do is import the library in this case e1071, with this imported we use the naiveBayes function to generate our classifier the following parameters, indicating our Variable to predict in the formula.
``` R
# Fitting SVM to the Training set
# install.packages('e1071')
library(e1071)
classifier = naiveBayes(formula = Purchased ~ .,
                        data = training_set,
                        type = 'C-classification',
                        kernel = 'linear')
```

Having our model, we use the predict function and assign our data set to start the training.
``` R
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```

We can use a confusion matrix to observe the result of the training.
``` R
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm
```

# Visualize
With the model defined, we proceed to perform the visualization with the support of the training and test dataset, in order to observe the differences.
``` R
# Visualising the Training set results
install.packages('ElemStatLearn')
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![Alt text](Image1.PNG?raw=true)


``` R
# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![Alt text](Image2.PNG?raw=true)
