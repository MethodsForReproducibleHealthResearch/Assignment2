df <- read.csv("cohort.csv")
Smoker <- mean(df$smoke, na.rm=TRUE)*100
Cardiac_Event <- mean(df$cardiac, na.rm=TRUE)*100
Female <- mean(df$female, na.rm=TRUE)*100
Age <- mean(df$age, na.rm=TRUE)
Cost <- mean(df$cost, na.rm=TRUE)

#Prediction Algorithm 
regression_model <- glm(cardiac ~ age + female + smoke, family = binomial(link = "logit"), data = df)
summary(regression_model)
OR <- exp(coef(regression_model))
print(OR)

#Table1
Cohort_Characteristics_Table <- data.frame(
    Variable = c("Smoker (%)", "Cardiac Event (%)", "Female (%)", "Age (mean)", "Cost (mean, $)"),
    Value = c(Smoker, Cardiac_Event, Female, Age, Cost), stringsAsFactors = FALSE)
cat("Cohort Characteristics Table\n")
print(Cohort_Characteristics_Table)
write.csv(Cohort_Characteristics_Table, "Cohort_Characteristics_Table.csv", row.names = FALSE)

