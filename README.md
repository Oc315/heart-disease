# 🫀 Heart Disease Prediction Project

This project analyzes the **Heart Disease dataset** from the **UCI Machine Learning Repository**.  
The goal is to process the data, summarize key trends, visualize distributions, and eventually build predictive models for heart disease classification.

---

## 📁 Project Structure

- `data/`: Contains the raw dataset (`processed.cleveland.data`)
- `code/`: Contains all analysis scripts:
  - `01_preprocess.R`: Loads, cleans, and preprocesses the dataset; saves output as `output/heart_clean.rds`
  - `02_summary_table.R`: Creates a summary table with key descriptive statistics; output saved as `output/summary_table.rds`
  - `03_plot_distribution.R`: Generates a histogram of age by heart disease status; output saved as `output/age_dist.png`
- `output/`: Contains all generated files (.rds, .png) used in the report
- `report/`: Contains the main R Markdown report file and final HTML report
  - `report.Rmd`: Pulls from output files to generate the final formatted report
- `Makefile`: Automates the full analysis pipeline from data cleaning to report generation
- `.gitignore`: Ignores unnecessary or auto-generated files
- `README.md`: You're reading it!

---

## 📊 How to Generate the Final Report

Open a terminal inside the project folder and run:

```bash
make

