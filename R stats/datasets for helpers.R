#Violent Crime Rates by US State
View(USArrests)

#Hair and Eye Color of Statistics Students
#could do correlations?
View(HairEyeColor)

install.packages("DAAG")
library("DAAG")


View(quakes)
ggplot(presis, aes(x=Qtr1))+ geom_histogram(bins= 10)

presis<-data.frame(presidents)
View(presis)
dim(presidents)
data.frame(Y=as.matrix(presidents), date=time(presidents))

df <- data.frame(presidents, year = trunc(time(presidents)), 
                 year = year.abb[cycle(presidents)])

pres=as.matrix(presidents)
View(pres)
summarize(presidents)

install.packages("ts_reshape")
library("ts_reshape")
ts_reshape(ts.obj, type = "wide", frequency = NULL)

install.packages("tsbox")
library(tsbox)

try1<- ts_tbl(presidents)
#Separating elements in one column into separate columns
try2= separate(try1, col = time, sep ="-", into= c("year", "mo", "day"))
try=separate_cols(diditwork, time, sep = "-")
try3= pivot_wider(try2, names_from = year, values_from = value)
try4 <- try3[-c(1,2)]



df.long <- pivot_longer(try3, cols=1:30, names_to = "Year", values_to = "QTR")
