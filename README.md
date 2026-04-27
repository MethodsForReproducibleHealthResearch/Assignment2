# Assignment #2 Repository

This repository includes the simulated data for Assignment #2 for HRP 203 (Methods for Reproducible Health Research) class.

## Summary of findings
The script `analysis.r` was run on the cohort of 5,000 individuals (data in the raw-data folder; mean age 44.9, 57.3% female, 12.9% smokers). 
As `table1.csv` shows, a cardiac event occurred in 5.5% of the sample, 
but the rate varied substantially across
subgroups, specifically smokers had a much higher event rate than non-smokers, and male
smokers had the highest rate of any group.

A logistic regression predicting cardiac event from age, sex, and smoking
status confirmed this pattern. Smoking was the strongest predictor with an odds ratio of 9.6, followed
by male sex (women had ~92% lower odds than men). Age had a small but
statistically significant positive association with risk.

`figure.png` visualizes these results, plotting predicted probability of a
cardiac event against age for each combination of sex and smoking status. The
four groups are clearly separated, with male smokers at the
top and female non-smokers at the bottom, and each band slopes slightly upward
with age. It is interesting that smoking's effect is much larger in men than in women, and that observation should be studied further. 

## Generative AI statement

I attest to the fact that I did not use generative AI technology to complete any portion of the work.
