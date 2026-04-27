
#0 Loading data
df <- read.csv("raw-data/cohort.csv")


#1 Table describing variables (how the cardiac event rate differs across groups)
n_total <- nrow(df)

#helper to identify count, and proportion
np <- function(n,total) sprintf("%d (%.1f%%)", n, 100*n/total)

#counts by sex
n_male   <- sum(df$female==0)
n_female <- sum(df$female==1)

#smokers within each gender
male_smokers   <- sum(df$female==0 & df$smoke==1)
female_smokers <- sum(df$female==1 & df$smoke==1)

#cardiac events overall and within key subgroups
events_total <- sum(df$cardiac==1)
events_male <- sum(df$female==0 & df$cardiac==1)
events_female <- sum(df$female==1 & df$cardiac==1)
events_smokers <- sum(df$smoke==1  & df$cardiac==1)
events_nonsmokers <- sum(df$smoke==0  & df$cardiac==1)
events_male_smoker <- sum(df$female == 0 & df$smoke==1 & df$cardiac==1)
events_female_smoker <- sum(df$female == 1 & df$smoke==1 & df$cardiac==1)

summary_table <- data.frame(
  Characteristic = c(
    "Total cohort",
    "Mean age (years)",
    "Mean cost (USD)",
    "Sex",
    "Male",
    "Female",
    "Smoking",
    "Smokers (overall)",
    "Male smokers (of all males)",
    "Female smokers (of all females)",
    "Cardiac events",
    "Cardiac events (overall)",
    "Events in males (of all males)",
    "Events in females (of all females)",
    "Events in smokers (of all smokers)",
    "Events in non-smokers (of all non-smokers)",
    "Events in male smokers (of male smokers)",
    "Events in female smokers (of female smokers)"
  ),
  Value = c(
    as.character(n_total),
    sprintf("%.1f", mean(df$age)),
    sprintf("%.0f", mean(df$cost)),
    "",
    np(n_male,   n_total),
    np(n_female, n_total),
    "",
    np(sum(df$smoke==1), n_total),
    np(male_smokers, n_male),
    np(female_smokers, n_female),
    "",
    np(events_total, n_total),
    np(events_male,   n_male),
    np(events_female, n_female),
    np(events_smokers,  sum(df$smoke==1)),
    np(events_nonsmokers, sum(df$smoke==0)),
    np(events_male_smoker, male_smokers),
    np(events_female_smoker, female_smokers)
  )
)
print(summary_table)
write.csv(summary_table, "table.csv", row.names = FALSE)

#2 Prediction algorithm (Regression-based approach)
fit <- glm(cardiac ~ age + smoke + female, data=df, family=binomial)
print(summary(fit))


#3 Figure
df$pred <- predict(fit, type = "response")

#group labels for the figure
df$group <- with(df, ifelse(female==0 & smoke==1, "Male smoker",
                            ifelse(female==1 & smoke==1, "Female smoker",
                                   ifelse(female==0 & smoke==0, "Male non-smoker",
                                          "Female non-smoker"))))
df$group <- factor(df$group,
                   levels = c("Male smoker", "Female smoker",
                              "Male non-smoker", "Female non-smoker"))

group_colors <- c("Male smoker" = "red",
                  "Female smoker" = "blue",
                  "Male non-smoker" = "purple",
                  "Female non-smoker" = "darkgreen")

png("figure.png", width = 800, height = 550)
par(mar = c(5, 5, 4, 2))
plot(df$age, df$pred,
     xlab = "Age",
     ylab = "Predicted probability of cardiac event",
     main = "Predicted cardiac event risk by age, sex, and smoking status",
     pch = 16,
     col = group_colors[df$group])
legend("topleft",
       legend = levels(df$group),
       col = group_colors,
       pch = 16,
       bty = "n")
dev.off()
