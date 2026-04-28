# Assignment #2 Repository

This repository includes the simulated data for Assignment #2. Fork this repository and add your analysis as described in the canvas assignment.

The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`.

> #############1: Table Describing Variables#############
>      smoke            female            age           cardiac           cost      
 Min.   :0.0000   Min.   :0.0000   Min.   :18.00   Min.   :0.000   Min.   : 8012  
 1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:31.00   1st Qu.:0.000   1st Qu.: 9090  
 Median :0.0000   Median :1.0000   Median :45.00   Median :0.000   Median : 9376  
 Mean   :0.1292   Mean   :0.5732   Mean   :44.94   Mean   :0.055   Mean   : 9398  
 3rd Qu.:0.0000   3rd Qu.:1.0000   3rd Qu.:59.00   3rd Qu.:0.000   3rd Qu.: 9676  
 Max.   :1.0000   Max.   :1.0000   Max.   :72.00   Max.   :1.000   Max.   :11370  
> 
> #############2: Linear Regression#############
> 
> my_model <- glm(cost ~., smoke + age + female + cardiac,
+     family = gaussian, 
+     data = cohort)
> 
> ###############3: Plot###############
> 
> par(mfrow = c(1, 2))
> 
> ####Smoke####
> plot(cohort$smoke, cohort$cost, 
+      main = "Assignment 2 Regression Plot", 
+      xlab = "Smoke", 
+      ylab = "Cost")
> 
> abline(my_model, col = "red", lwd = 2)
Warning message:
In abline(my_model, col = "red", lwd = 2) :
  only using the first two of 5 regression coefficients
> 
> ####Age####
> 
> plot(cohort$age, cohort$cost, 
+      main = "Assignment 2 Regression Plot", 
+      xlab = "Age", 
+      ylab = "Cost")
> 
> abline(my_model, col = "red", lwd = 2)
Warning message:
In abline(my_model, col = "red", lwd = 2) :
  only using the first two of 5 regression coefficients
> 
> ####Female####
> 
> plot(cohort$female, cohort$cost, 
+      main = "Assignment 2 Regression Plot", 
+      xlab = "Female", 
+      ylab = "Cost")
> 
> abline(my_model, col = "red", lwd = 2)
Warning message:
In abline(my_model, col = "red", lwd = 2) :
  only using the first two of 5 regression coefficients
> 
> ####Cardiac####
> 
> plot(cohort$cardiac, cohort$cost, 
+      main = "Assignment 2 Regression Plot", 
+      xlab = "Cardiac", 
+      ylab = "Cost")
> 
> abline(my_model, col = "red", lwd = 2)
Warning message:
In abline(my_model, col = "red", lwd = 2) :
  only using the first two of 5 regression coefficients
> 
> geom_smooth(method = "lm")
geom_smooth: na.rm = FALSE, orientation = NA, se = TRUE
stat_smooth: na.rm = FALSE, orientation = NA, se = TRUE, method = lm
position_identity 
>
> <img width="1590" height="894" alt="regression plot " src="https://github.com/user-attachments/assets/5d957b3c-b585-4c6d-b095-91c86715a234" />

> #############4: Summary of Findings#############
> summary(my_model)

Call:
glm(formula = cost ~ ., family = gaussian, data = cohort, weights = smoke + 
    age + female + cardiac)

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 8708.2984    12.2953  708.26   <2e-16 ***
smoke        508.6336    10.0461   50.63   <2e-16 ***
female      -269.3246     6.7310  -40.01   <2e-16 ***
age           16.6895     0.2194   76.08   <2e-16 ***
cardiac      522.6343    14.7812   35.36   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for gaussian family taken to be 2397895)

    Null deviance: 4.4128e+10  on 4999  degrees of freedom
Residual deviance: 1.1977e+10  on 4995  degrees of freedom
AIC: 68867

Number of Fisher Scoring iterations: 2

> 
> ###############5: I did not use AI to complete this assignment###############
