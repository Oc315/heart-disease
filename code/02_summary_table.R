# code/02_summary_table.R

library(tidyverse)
library(here)

# Load cleaned data
heart_data <- readRDS(here("output", "heart_clean.rds"))

# Summary table
summary_table <- heart_data %>%
  summarise(
    mean_age = mean(Age, na.rm = TRUE),
    mean_trestbps = mean(Trestbps, na.rm = TRUE),
    mean_chol = mean(Chol, na.rm = TRUE),
    mean_thalach = mean(Thalach, na.rm = TRUE),
    disease_count = sum(Target != "No Disease", na.rm = TRUE),
    no_disease_count = sum(Target == "No Disease", na.rm = TRUE)
  )

# Save to RDS
saveRDS(summary_table, here("output", "summary_table.rds"))
