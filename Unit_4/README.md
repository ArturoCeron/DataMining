# K-Means Clustering

Set our workspace
``` R
getwd()
setwd("C:/Users/CORSAIR/DataminingRomero/DataMining/MachineLearning/Evaluacion")
getwd()
```

Importing the dataset

``` R
dataset = read.csv('iris.csv')
```

Creating different datasets with specific columns 

``` R
dataset = dataset[1:4]
sepal_dataset=dataset[1:2]
petal_dataset=dataset[3:4]
```

Using the elbow method to find the optimal number of clusters

``` R
set.seed(15)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```

![Alt text](https://github.com/ArturoCeron/DataMining/blob/Unit_4/Unit_4/Evaluation/Images/ElbowMethod.png)

Getting the clusters in the petal data

``` R
petal_kmeans = kmeans(x = petal_dataset, centers = 3, iter=1)
petal_clusters = petal_kmeans$cluster
```

Visualising the clusters using petal data
Install cluster package if needed

``` R
library(cluster)
clusplot(petal_dataset,
         petal_clusters,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of petal Iris'),
         xlab = 'Petal length',
         ylab = 'Petal witdth')
```

![Alt text](https://github.com/ArturoCeron/DataMining/blob/Unit_4/Unit_4/Evaluation/Images/PetalIris.png)

Getting the clusters in the sepal data

``` R
sepal_kmeans = kmeans(x = sepal_dataset, centers = 3)
sepal_clusters = sepal_kmeans$cluster
```

Visualising the clusters using sepal data
Install cluster package if needed

``` R
set.seed(12)
library(cluster)
clusplot(sepal_dataset,
         sepal_clusters,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Sepal Iris'),
         xlab = 'Sepal length',
         ylab = 'Sepal witdth')
```
![Alt text](https://github.com/ArturoCeron/DataMining/blob/Unit_4/Unit_4/Evaluation/Images/SepalIris.png)

Getting the clusters in all the data

``` R
kmeans = kmeans(x = dataset, centers = 3)
y_clusters = kmeans$cluster
```

Visualizing the clusters using all data
Install cluster package if needed

``` R
set.seed(12)
library(cluster)
clusplot(dataset,
         y_clusters,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Iris'),
         xlab = 'x label',
         ylab = 'y label')
```

![Alt text](https://github.com/ArturoCeron/DataMining/blob/Unit_4/Unit_4/Evaluation/Images/AllClusters.png)
