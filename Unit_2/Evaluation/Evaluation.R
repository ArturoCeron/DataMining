setwd("C:/Users/cheke/Desktop/Ariel/Mineria/DataMining/Unit_2/Evaluation")
Data <- read.csv("Project-Data.csv")

#Libreria, importar si no se tiene
library(ggplot2)


#Limitar por genero
Data1<-Data[which(Data$Genre=="action"|Data$Genre=="adventure"|
                    Data$Genre=="animation"|Data$Genre=="comedy"|
                    Data$Genre=="drama"),]
#Limitar por estudio
Data1<-Data1[which(Data1$Studio=="Buena Vista Studios"|Data1$Studio=="Fox"|
                     Data1$Studio=="Paramount Pictures"|Data1$Studio=="Sony"|
                     Data1$Studio=="Universal"|Data1$Studio=="WB"),]
#Graficar utilizando 2 facetas, jitter con los parametros de budget y color
#y boxplot haciendolo transparente y sin valores fuera de la caja
p <- ggplot(Data1, aes(x=Genre, y=Gross...US))+
  geom_jitter(aes(size=Budget...mill.,color=Studio))+
  geom_boxplot(size=0.5, alpha=0.5, outlier.shape = NA)                  

