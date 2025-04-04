# code/03_plot_distribution.R

library(tidyverse)
library(here)

# Load cleaned data
heart_data <- readRDS(here("heart+disease", "output", "heart_clean.rds"))

# Histogram
p <- ggplot(heart_data, aes(x = Age, fill = Target)) +
  geom_histogram(binwidth = 5, position = "dodge") +
  labs(title = "Age Distribution by Heart Disease Status",
       x = "Age",
       y = "Count",
       fill = "Heart Disease Severity") +
  theme_minimal()

# Save plot
ggsave(here("heart+disease", "output", "age_histogram.png"), plot = p, width = 8, height = 5)
