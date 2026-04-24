# Assignment #2 Repository

This repository includes the simulated data for Assignment #2. Fork this repository and add your analysis as described in the canvas assignment.

The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`.

Variable Description:
Each observation represents a hospitilzation for an individual with the following characterisitcs: 
smoke = '1' indicates patient is a smoker. 0 patient is not a smoker.
female = '1' indicates patient is female. 0 = male 
age = numeric, continous variable, measured in years
cardiac = '1' indicates patient had a cardiac event (CE). 0 = patient did not. 
cost = numeric, continous, in $USD. Represents total costs for the hospitilization. 

Analysis Branch 

#Cohort_Characteristics_Table.csv
This table shows the baseline characteristics of the cohort. 

#Assignment2_PredictionAlgorithm 
To assess predictors of cardiac events, we regressed cardiac events on age, sex, and smoking using a logistic regression model. 

#Assignment2_Figure1.tiff
Box plots showing median costs for those with cardiac events vs not, generated using ggplot2

#Summary
The cardiac event (CE) rate is 5.5%, 12.9% are smokers, 57.3% female, with a mean age of 44.9, and mean cost $9398 (Cohort_Characteristics_Table). Smokers had a 9.59 increased odds of CEs (p<0.001). Being female was strongly protective of having a CE (OR=0.07, p<0.001), while age increased odds of CE slightly (1.01, p<0.031). Those who had a CE appeared to have higher hospitilization costs (Figure 1). 

I did not use generative AI technology (e.g., ChatGPT) to complete any portion of the work.
