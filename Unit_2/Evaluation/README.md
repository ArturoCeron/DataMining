First thing to do is set the work directory and load the data

``` R
setwd("C:/Users/cheke/Desktop/Ariel/Mineria/DataMining/Unit_2/Evaluation")
Data <- read.csv("Project-Data.csv")
```

Then load the necesary libraries

``` R
library(ggplot2)
library(extrafont)
font_import()
```

Filtering data by genre

``` R
Data1<-Data[which(Data$Genre=="action"|Data$Genre=="adventure"|
                    Data$Genre=="animation"|Data$Genre=="comedy"|
                    Data$Genre=="drama"),]
```

Another filter, this time by studio
``` R
Data1<-Data1[which(Data1$Studio=="Buena Vista Studios"|Data1$Studio=="Fox"|
                     Data1$Studio=="Paramount Pictures"|Data1$Studio=="Sony"|
                     Data1$Studio=="Universal"|Data1$Studio=="WB"),]
```

Create object p as a graphic with a jitter geometry and a boxplot geometry with size Budget and color Studio
Also the aesthetics for the graphic are Genre as X axis and Gross as Y axis
``` R
p <- ggplot(Data1, aes(x=Genre, y=Gross...US))+
  geom_jitter(shape = 20, aes(size = Budget...mill.,color=Studio))+
  geom_boxplot(size=0.5, alpha=0.7, outlier.shape = NA)    
```

Finally plotting the graphic, changing the label of X and Y axles as Genre and Gross % Us respectively
The graphic needs some change in the titles, so we used Comic Sans Ms as the family font to make the graphic the most precisely as the one required
``` R
p +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(family = "Comic Sans MS",
                                    color = "Purple", size=13),
        axis.title.y = element_text(family = "Comic Sans MS",
                                    color = "Purple", size=13),
        legend.justification = c(1,1),
        plot.title = element_text(family = "Comic Sans MS", 
                                  color = "Black", size = 15,hjust=0.5))
```

These are the results obtained

![Alt text](https://github.com/ArturoCeron/DataMining/blob/Unit_2/Unit_2/Evaluation/Rplot.png)
