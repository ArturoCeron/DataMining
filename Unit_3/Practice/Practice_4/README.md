# Unit 3
#Practice 4

The first thing to do is set the working directory for the project in R. Using "setwd" the modification is made.
``` R
# K-Nearest Neighbors (K-NN)

setwd("C:/Users/CORSAIR/DataminingRomero/DataMining/MachineLearning/MultipleLinearRegression")
getwd()
```

The dataset is imported and it is specified to use only some columns (3 to 5)
``` R
# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

The value of the column "Purchased" is changed as a factor type to be able to be used later
``` R
# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

The dataset is divided into 2 parts, training and testing with a ratio of 0.75, in addition the seed is specified to have a randomness.
``` R
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

The training and test values are scaled to model them for use in the KNN algorithm.
``` R
# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

The test and training data are sent to the KNN algorithm, in addition the variable k is set as 5 to seek to obtain a better classification.
``` R
# Fitting K-NN to the Training set and Predicting the Test set results
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)
```

Creation of the confusion matrix using the predictor variable created from the knn algorithm and sending the test data.
``` R
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
```

Visualization of the results using the training values of the algorithm.
``` R
# Visualising the Training set results
install.packages('ElemStatLearn')
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

Results of training values in KNN algorithm (k = 5)

![Alt text](https://github.com/ArturoCeron/DataMining/blob/Unit_3/Unit_3/Practice/Practice_4/practice4-1.PNG)

Viewing the results using the algorithm test values.
``` R
# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

Results of test values in KNN algorithm (k = 5) 

![Alt text](https://github.com/ArturoCeron/DataMining/blob/Unit_3/Unit_3/Practice/Practice_4/practice4-2.PNG)
