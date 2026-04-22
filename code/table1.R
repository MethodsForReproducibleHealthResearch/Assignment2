## table1.R ----

## IMPORTS ----
#### if need to install packages, run below
# install.packages("here")
# install.packages("readr")
# install.packages("tidyverse")
# install.packages("table1")

library(here)
library(tidyverse)
library(readr)
library(table1)

## CONSTANTS ----


## LOAD DATA ----
raw_data <- read_csv(here("raw-data", "cohort.csv"))
glimpse(raw_data)

## FUNCTIONS ----


## TABLE 1 ----
tb1_df <- 
    raw_data |> 
    mutate(
        smoke = factor(smoke), 
        female = factor(female), 
        cardiac = factor(cardiac)
    )


table1(
    ~ age + 
        female + 
        cost + 
        smoke | 
        cardiac,
    data = tb1_df
)

