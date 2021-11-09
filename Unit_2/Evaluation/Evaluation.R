setwd("C:/Users/cheke/Desktop/Ariel/Mineria/DataMining/Unit_2/Evaluation")
Data <- read.csv("Project-Data.csv")

#Libreria, importar si no se tiene
library(ggplot2)
library(dplyr)
head(Data)
colnames(Data) 
head(Data)
tail(Data)
str(Data)
summary(Data)

#Limitar por genero
Data1<-Data[which(Data$Genre=="action"|Data$Genre=="adventure"|
                    Data$Genre=="animation"|Data$Genre=="comedy"|
                    Data$Genre=="drama"),]
#Limitar por estudio
Data1<-Data1[which(Data1$Studio=="Buena Vista Studios"|Data1$Studio=="Fox"|
                     Data1$Studio=="Paramount Pictures"|Data1$Studio=="Sony"|
                     Data1$Studio=="Universal"|Data1$Studio=="WB"),]

j <- ggplot(Data1, aes(x=Genre, y=Gross...US, size=Budget...mill.,color=Studio))+geom_jitter()
b <- ggplot(Data1, aes(x=Genre, y=Gross...US, size=Budget...mill.))+geom_boxplot()                  

