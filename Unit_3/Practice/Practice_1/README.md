# Unit_3
# Practice 1


``` R

```


Analize the corresponding code to the visualization of data on the machine learning model
 
 # Reading Data
The first step is make the data reading, we need to get our work directory, the work directory must contain the script and the csv so we can read them. 

``` R
getwd()
# Importing the dataset
dataset <- read.csv('Salary_Data.csv')
```

# Cleaning data


We need to separate the dataset in training and test, we use the split function that can split the dataset in a expected ratio, and then we can assign them into a corresponding variable.

``` R
# Splitting the dataset into the Training set and Test set
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
Para hacer uso de un modelo lineal simple como es regresión
```

# Model and training
R contains the lm(linear model) function, with this we can create a model using only a few parameters like formula and data.
And then we print the sumary and it shows the model.  
``` R
regressor = lm(formula = Salary ~ YearsExperience,
data = dataset)
summary(regressor)
```
now we have to use the predict function to train our data in the model.
``` R
# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
```

# Visualize data
Finaly we can bring all together into a plot, so we can se how the model makeup and then using the same line of training we can compare it with the test data 

``` R
# Visualising the Training set results
library(ggplot2)
ggplot() +
geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
color = 'red') +
geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata
= training_set)),
color = 'blue') +
ggtitle('Salary vs Experience (Training Set)') +
xlab('Years of experience') +
ylab('Salary')
```

``` R
# Visualising the Test set results
ggplot() +
geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
color = 'red') +
geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata
= training_set)),
color = 'blue') +
ggtitle('Salary vs Experience (Test Set)') +
xlab('Years of experience')
```

![Alt text](https://raw.githubusercontent.com/ArturoCeron/DataMining/Unit_3/Unit_3/Practice/Practice_1/image1.bmp)
![Alt text](https://raw.githubusercontent.com/ArturoCeron/DataMining/Unit_3/Unit_3/Practice/Practice_1/Image2.bmp)
