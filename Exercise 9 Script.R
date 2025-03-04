#John LeSage
#Biocomputing Exercise 9, 11/14/23

#Question 1
setwd("~/Desktop/Exercise9")
#navigates R to Exercise 9 directory, where the appropriate files are stored
library(ggplot2)
library(cowplot)
temps <- read.table("temps.txt", header=TRUE, sep=",", stringsAsFactors=FALSE)
#setting up data frame and appropriate R packages
ggplot(data=temps, aes(x=Latitude, y=AvgHigh)) + geom_point() + xlab("Latitude (degrees N)") + ylab("Avg. March High (degrees F)") + stat_smooth(method = "lm") + ggtitle("City latitude vs. temp")
#I plotted the latitude of 20ish cities against their average March high
#Expected to see a negative linear relationship between latitude and temp, this is indeed what we got



#Question 2
data <- read.table("data.txt", header=TRUE, sep=",", stringsAsFactors=FALSE)
#loads the "data.txt" file into R, where it is stored as a data frame

ggplot(data, aes(x=region, y=observations)) + stat_summary(fun.y = mean, geom = "bar") + xlab("Region") + ylab("Observation values") + ggtitle("Mean observations by region")
#Question 2a: graph of means using the stat_summary function

ggplot(data, aes(x=region, y=observations)) + geom_point() + geom_jitter() + xlab("Region") + ylab("Observation values") + ggtitle("Scatterplot of all observations")
#Question 2b: graph of all data points using geom_point

#The barplot, using the stat_summary function, clearly shows us the means of each region, but it doesn't tell us about data distribution.
#Meanwhile, the scatterplot shows the spread of the data, but there's a lot of points and it's difficult to read.
#A violin plot would be good at showing the most common values AND the spread...


#Violin plot combining mean and data spread
ggplot(data, aes(x=region, y=observations)) + geom_violin(fill="lightblue") + stat_summary(fun.y = "mean", geom = "point", color = "red") + xlab("Region") + ylab("Observation value") + ggtitle("Violin plot of data mean and spread")
#we see that north values are tightly clustered around 15, south has a bimodal distribution at 5 and 25, and west and east have a wide range of values