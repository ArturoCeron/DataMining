# Unit_3
# Practice 2


Before starting with the development of the program, it is necessary to establish the working directory and read the data from the file, this is done as follows.
``` R
setwd("C:/Users/CORSAIR/DataminingRomero/DataMining/MachineLearning/MultipleLinearRegression") 
getwd() 
# Importing the dataset 
dataset <- read.csv('50_Startups.csv')
```

Subsequently, a coding of the states is made within the dataset, the names are changed by numerical values.

``` R
# Encoding categorical data 
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
```

The preparation of the test and training values ​​necessary for the use of the model begins.

``` R
# Splitting the dataset into the Training set and Test set
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

A regressor variable is created where the lm function will be used for linear models, giving as parameters the profit as its formula to use and the training data that was previously prepared

``` R
# Fitting Multiple Linear Regression to the Training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )
summary(regressor)
```

A prediction of the results is made using the regressor created and the test data that was generated previously.

``` R
# Prediction the Test set results
y_pred = predict(regressor, newdata = test_set)
```

The regressor is rewritten using backward elimination, this consists of executing the function and each time eliminating one of the variables that it takes into account, this always with the complete data of the dataset.

``` R
# Assigment: visualize the siple liner regression model with R.D.Spend 

# Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)
```

Once the optimal model is built in the regressor variable, a new prediction of results is made using the prepared test data.

``` R
y_pred = predict(regressor, newdata = test_set)
```

Generation of the backwardElimination function, a function used that receives two values ​​as parameters. X as the training values ​​and SL as the value that must not be exceeded to have an optimal model.
This function obtains the coefficients of the model of the regressor variable that we have, obtaining maximum values, what is sought is that these maximum values ​​are not greater than the SL since the results sought is to obtain a value close to 0 or that is 0 for let the regression work. Once the cycle in charge of verifying the maximum value is finished, a regressor must be obtained with the most optimal model for the execution of the program.

``` R
# Homework analise the follow atomation backwardElimination function 
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}
```

Finally, the function is used by sending the test data as parameters and the desired SL so that it has a minimum to obtain.

``` R
training_set
backwardElimination(training_set, SL)
```

The results obtained are as follows, thus demonstrating that the coefficients obtained are 0 or very close to 0, this can be identified by the amount of '*' that each variable has within the "Coefficients" section. 

![Alt text](https://github.com/ArturoCeron/DataMining/blob/Unit_3/Unit_3/Practice/Practice_2/practice2.PNG)
