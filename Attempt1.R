rm(list=ls())
setwd("/Users/anant/OneDrive - UBC/BABS 508 Assignment")
library("readxl")
library(dplyr)
df <- as.data.frame(read_excel("Attrition Sample 11.xlsx"))


# Confirm no column has NAs
colSums(is.na(df))

# 525 rows
nrow(df)

#20 columns
ncol(df)


# Ordinal encoding of travel - manually
df$TravelLevel = case_when (
  df$BusinessTravel == 'Travel_Frequently' ~ 2,
  df$BusinessTravel == 'Travel_Rarely' ~ 1,
  df$BusinessTravel == 'Non-Travel' ~ 0
)

# View to confirm
df %>%
  select(BusinessTravel, TravelLevel) %>%
  View()

# One hot encoding




predictors <- df %>%
  select()
# worklife balance
correlation =  cor(df)