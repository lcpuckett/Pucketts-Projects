# manovas are like anovas on steroids, can do all the types of anovas
#tests for multivariate normality
library("mvnormtest")
#testing for homogeneity of variance
library("car")

kickstarter <- read.csv("C:/Users/latri/Desktop/kickstarter.csv")

#Does the country the project originated in influence the number of backers and the amount of money pledged?
#independent variable is the project country origin, 2 dependent variables: number of backers and amount pledged

#there is no wrangling required to run MANOVAs but we will need to do a bit for the assumptions
#for multivariate normality, need to create a dataset with only DV's in matrix format, and make sure they are numeric.can only handle 5k records

#when checking the format we find that they are factors and need to be numeric
str(kickstarter$pledged)
str(kickstarter$backers)
#changing them to numeric
kickstarter$pledged <- as.numeric(kickstarter$pledged)
kickstarter$backers <- as.numeric(kickstarter$backers)

#keep only your two dependent variables
keeps <- c("pledged", "backers")
kickstarter1 <- kickstarter[keeps]
#limit the number of rows since we can only have 5k
kickstarter2 <- kickstarter1[1:5000,]
#make it a matrix
kickstarter3 <- as.matrix(kickstarter2)

#sample size assumption is met
#checking for normality, use wrangled dataset in the test
mshapiro.test(t(kickstarter3))
#getting an error: Error in if (rng == 0) stop("all `U[]' are identical") : missing value where TRUE/FALSE needed
#violated assumption of normality

#checking for homogeneity in pledged, firstz DV
leveneTest(pledged ~ country, data=kickstarter)
#now check the backers DV as well
leveneTest(backers ~ country, data=kickstarter)
#both have failed the test

#time to check for absence of multicollinearity, run correlations on DVs. anything above 0.7 in correlation means there is multicollinearity
cor.test(kickstarter$pledged, kickstarter$backers, method="pearson", use="complete.obs")
#the notes say we passed the test because they have correlation at 0.32 but mine is at 0.73

#now time for analysis, use manova
#binding dependent variables in cbind() to be examined together, specify IV
MANOVA <- manova(cbind(pledged, backers) ~ country, data = kickstarter)
summary(MANOVA)
#there is significant difference b/n backers and funds pledged by country

#time to look at post hocs, which dependent variable is different
#the first post hoc of a MANOVA is an ANOVA
#feed in name of manova model and a type of correction for type 1 error
summary.aov(MANOVA, test = "wilks") 
