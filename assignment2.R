data<- read.csv("/Users/amnatariq/Downloads/Assignment2-main/raw-data/cohort.csv")

table(data$smoke)
table(data$female)
table(data$age)
table(data$cardiac)
table(data$cost)

library(gtsummary)
tbl_summary(data)

hist(data$age)



model <- glm(cardiac ~ female+age+smoke+cost,
             data = data, 
             family = binomial())
summary(model)
