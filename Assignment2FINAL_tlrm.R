install.packages("crosstable")
cohort <- read.csv("cohort.csv")
install.packages("gtsummary")
library(gtsummary)

#############1: Table Describing Variables############
table(cohort)
summary(cohort)

#############2: Linear Regression#############

my_model <- glm(cost ~., smoke + age + female + cardiac,
    family = gaussian, 
    data = cohort)

###############3: Plot###############

par(mfrow = c(1, 2))

####Smoke####
plot(cohort$smoke, cohort$cost, 
     main = "Assignment 2 Regression Plot", 
     xlab = "Smoke", 
     ylab = "Cost")

abline(my_model, col = "red", lwd = 2)

####Age####

plot(cohort$age, cohort$cost, 
     main = "Assignment 2 Regression Plot", 
     xlab = "Age", 
     ylab = "Cost")

abline(my_model, col = "red", lwd = 2)

####Female####

plot(cohort$female, cohort$cost, 
     main = "Assignment 2 Regression Plot", 
     xlab = "Female", 
     ylab = "Cost")

abline(my_model, col = "red", lwd = 2)

####Cardiac####

plot(cohort$cardiac, cohort$cost, 
     main = "Assignment 2 Regression Plot", 
     xlab = "Cardiac", 
     ylab = "Cost")

abline(my_model, col = "red", lwd = 2)

geom_smooth(method = "lm")

#############4: Summary of Findings#############
summary(my_model)

###############5: I did not use AI to complete this assignment###############

