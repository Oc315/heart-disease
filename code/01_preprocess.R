# code/01_preprocess.R

library(tidyverse)
library(here)

# Load data
data_path <- here("data", "processed.cleveland.data")
heart_data <- read.table(data_path, sep = ",", header = FALSE, na.strings = "?")

# Assign column names
colnames(heart_data) <- c("Age", "Sex", "CP", "Trestbps", "Chol", "FBS",
                          "RestECG", "Thalach", "Exang", "Oldpeak", "Slope",
                          "CA", "Thal", "Target")

# Factor variables
heart_data$Sex <- factor(heart_data$Sex, levels = c(0, 1), labels = c("Female", "Male"))
heart_data$CP <- factor(heart_data$CP, levels = c(1, 2, 3, 4), labels = c("Typical", "Atypical", "Non-anginal", "Asymptomatic"))
heart_data$FBS <- factor(heart_data$FBS, levels = c(0, 1), labels = c("False", "True"))
heart_data$RestECG <- factor(heart_data$RestECG, levels = c(0, 1, 2), labels = c("Normal", "ST-T wave abnormality", "LVH"))
heart_data$Exang <- factor(heart_data$Exang, levels = c(0, 1), labels = c("No", "Yes"))
heart_data$Thal <- factor(heart_data$Thal, levels = c(3, 6, 7), labels = c("Normal", "Fixed defect", "Reversible defect"))
heart_data$Target <- factor(heart_data$Target, levels = c(0, 1, 2, 3, 4),
                            labels = c("No Disease", "Mild", "Moderate", "Severe", "Critical"))

# Impute missing values
heart_data <- heart_data %>%
  mutate(across(where(is.numeric), ~ replace_na(., median(., na.rm = TRUE))))

# Save to RDS
saveRDS(heart_data, here("output", "heart_clean.rds"))
