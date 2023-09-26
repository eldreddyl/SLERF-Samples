#### Packages and Files #### 

# Libraries 
library(tidyverse)
library(dplyr)
library(readr)
library(ggplot2)


#Set equal to file directory
insurance_data_ml <- "C:\\Users\\Dylan\\OneDrive\\Desktop\\DylanEldred_code_samples\\DylanEldred_sample_datasets\\insurance.csv"

#Create Dataframe
insurance <- read.csv(insurance_data_ml)

# Replace 'yes' and 'no' in smoker variable with boolean values
# If person smokes = 1, otherwise 0

insurance$smoker <- ifelse(insurance$smoker == "yes", 1, 0)


# Similarly, code sex as a dummy variable. Male = 1, 0 otherwise

insurance$sex <- ifelse(insurance$sex == "male", 1, 0)

#### Basic Summary Stats and Visualizatons #### 
summary(insurance)


# Distribution of Body Mass Index (BMI)
hist(insurance$bmi, breaks = 10,col = 'lightblue', main = 'Distribution of BMI', xlab = 'BMI', xlim = c(10,60))

# Distribution of  Medical Claims Paid (charges)
hist(insurance$charges, breaks = 100,col = 'lightgreen', main = 'Distribution of Medical Charges', xlab = 'Charges ($)',xlim = c(1000,65000))

# Graphical Relationship between BMI and charges

plot(bmi ~ charges, data = insurance)

#### Basic Regressions #### 

# Single Regression

insurance_simple.lm <- lm(charges ~ bmi, data = insurance)

summary(insurance_simple.lm)


# Multiple Regression

insurance_multiple.lm <- lm(charges ~ bmi+smoker+age, data = insurance)

summary(insurance_multiple.lm)