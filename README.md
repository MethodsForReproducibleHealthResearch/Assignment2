# Assignment #2 Repository

This repository includes the simulated data for Assignment #2. Fork this repository and add your analysis as described in the canvas assignment.

The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`.

To run this, you will need to install the following packages and load into library: `gtsummary`, `effects`, `cowplot`

This code will:
- Read in the csv file for `cohort`
Generate a summary table for all variables (count for categorical/binary data and mean with quartiles for continuous data)
Create and provide outputs on the following regression models:
  (1) unadjusted effect of smoking on cardiovascular disease incidence (logistic regression)
  (2) adjusted effect of smoking on cardiovascular disease incidence, controlling for age and sex (logistic regression)
  (3) unadjusted effect of smoking on healthcare costs (linear regression)
  (4) adjusted effect of smoking on healthcare costs, controlling for age and sex (linear regression)
- Generate plots for models (2) and (4)