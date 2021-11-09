setwd("C:/Users/cheke/Desktop/Ariel/Mineria/DataMining/Unit_2/Evaluation")
Data <- read.csv("Project-Data.csv")

#Libreria, importar si no se tiene
library(ggplot2)
#Limitamos a los generos propuestos
lim<-c("action","adventure","animation","comedy","drama")
Datalim<-Data[which(Data$Genre==lim)]
