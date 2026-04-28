# ===============================
# Cohort analysis - BMDS244 Assignment 2
# Creator: Kyra Reu
# Created: 2026/04/28
# ===============================

# ===============================
# PART 1
# Load and explore dataset
# ===============================

# Load dataset, learn column names
df <- read.csv("raw_data/cohort.csv")
head(df)

# What values can each column have?
# Comments list assumptions I'm making for the purpose of doing the assignment
range(df$smoke)     # 0=never smoker, 1=ever smoker
range(df$female)    # 0=Male, 1=Female
range(df$age)       # 18-72 years old
range(df$cardiac)   # 0=no cardiac diagnosis, 1=some cardiac diagnosis
range(df$cost)      # $8012/year - $11370/year (really just guessing at units here)

# ===============================
# PART 2
# Create summary table
# ===============================

# # Calculate total number of individuals (rows
n_total <- nrow(df)
n_total # quality check

# Create data frame for summary table
summary_table <- data.frame(
  Characteristic = c(
    "Age in years (mean (SD))",
    "Female sex (%)",
    "Ever smoked (%)",
    "Has cardiac diagnosis (%)",
    "Cost in $/year (mean (SD))"
  ),
  `All individuals (N = 500)` = c(
    paste0(round(mean(df$age), 1), " (", round(sd(df$age), 1), ")"),
    paste0(round(mean(df$female) * 100, 1), "%"),
    paste0(round(mean(df$smoke) * 100, 1), "%"),
    paste0(round(mean(df$cardiac) * 100, 1), "%"),
    paste0(round(mean(df$cost)), " (", round(sd(df$cost)), ")")
  ),
  check.names = FALSE  # Keep column name with spaces/special characters
)

# View the table
print(summary_table)

# Save to CSV
write.csv(summary_table, "outputs/summary_table.csv", row.names = FALSE)

# ===============================
# PART 3
# Linear regression to predict cost
# ===============================

# Fit linear regression model to predict cost ($/year)
# Predictors: smoking history, age, sex, cardiac medical history
model <- lm(cost ~ smoke + age + female + cardiac, data = df)

# View results
summary(model)

# Interpretation
#   "Estimate" column: adding +1 to the predictor value changes cost by this much
#   "Pr(>|t|)" column: p-value
#   "R-squared": Model predicts this proportion of variance in cost
#   "Residual standard error": on average, model's predictions are off by this $ amount

# ===============================
# PART 4
# Plot cost as a function of age
# Raw data and regression line
# ===============================

png("outputs/cost_vs_age.png", width = 800, height = 600) # set up file destination
# Create scatter plot of actual data with regression line
plot(df$age, df$cost,
     xlab = "Age (years)",
     ylab = "Cost ($/year)",
     main = "Annual Healthcare Costs vs Age",
     pch = 16,           # Solid dots
     cex = 0.5,          # Smaller point size
     col = rgb(0, 0, 0, 0.3))  # Semi-transparent black dots

# Add regression line showing predicted values
# Create sequence of ages for smooth line
age_seq <- seq(min(df$age), max(df$age), length.out = 100)

# Predict costs for these ages (using mean values for other variables)
predicted_costs <- predict(model, 
                           newdata = data.frame(
                             age = age_seq,
                             smoke = mean(df$smoke),
                             female = mean(df$female),
                             cardiac = mean(df$cardiac)
                           ))

# Add the prediction line
lines(age_seq, predicted_costs, 
      col = "red", 
      lwd = 2)  # Line width = 2

# Add legend
legend("topleft", 
       legend = "Model prediction",
       col = "red", 
       lwd = 2)

print("Plot saved.")
dev.off() # Save at this point
