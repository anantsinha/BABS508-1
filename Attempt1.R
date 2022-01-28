rm(list=ls())
setwd("/Users/anant/OneDrive - UBC/BABS 508 Assignment")
library("readxl")
library(dplyr)

df <- data.frame(read_excel("Attrition Sample 11.xlsx"))

# Confirm no column has NAs
colSums(is.na(df))

num_cols <- unlist(lapply(df, is.numeric)) 
data_num <- df[ , num_cols]
# Checking multicollinearity in numeric data
cor(data_num)
correlations <- cor(data_num)
# Visualizing multicollinearity
#install.packages("corrplot")
library(corrplot)
corrplot(correlations)

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

df$Gender = case_when (
  df$Gender == 'Female' ~ 1,
  df$Gender == 'Male' ~ 0,
)

df <- select(df, select = -c("BusinessTravel"))
# One hot encoding
library(caret)
create_dummies <- dummyVars(" ~ .", data=df)
final_df <- data.frame(predict(create_dummies, newdata=df))
df <- final_df


# Visualizing Multicollinearity
correlations <- cor(df)
install.packages("corrplot")
library(corrplot)
corrplot(correlations)

predictors <- df %>%
  select()
# worklife balance
correlation =  cor(df)


library(rms)

View(df)