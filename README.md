# Assignment #2 Repository

This repository includes the simulated data for Assignment #2. I forked this repository from Dr. Rose's Assignment 2 repository.

===============
File structure:
===============

Naming convention: snake case (lowercase_with_underscores)
Date format: YYYY/MM/DD

| Assignment2
|---code/
|   ---analysis.R (all analyses for this assignment)
|---outputs/
|   ---cost_vs_age.png
|   ---summary_table.csv
|---raw_data/
|   ---cohort.csv
| .gitignore (do not track data or outputs)
| README.md (this file)

===============
Data:
===============
The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`.

Data dictionary (my assumptions):
VARIABLE    VALUES
smoke       0 = never smoked, 1 = ever smoked
female      0 = male, 1 = female
age         in years
cardiac     0 = no cardiac diagnosis, 1 = has cardiac diagnosis
cost        healthcare costs in $/year

===============
Preliminary analyses:
===============
Overview (see summary_table.csv):
57% of individuals are female.
13% of individuals have ever smoked.
5% of individuals have a cardiac diagnosis.
The mean age is 45 years (StDev = 16 years).
The mean cost is $9,400/year (StDev = $450/year).

Linear model predicting cost (see model summary printed to console):
Having ever smoked increases cost by $510/year (p<0.0001).
Every year of older age increases cost by $16.50/year (p<0.0001).
Female sex decreases cost by $270/year (p<0.0001).
Having a cardiac diagnosis increases cost by $520/year (p<0.0001).