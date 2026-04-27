
> summary(cohort)

> hist(cohort$age, main = "Age Distribution", xlab = "Age")

> model <- lm(cohort$cost ~ cohort$smoke + cohort$age + cohort$female + cohort$cardiac)
> 
> summary(model)
