# Heart Disease Prediction Project

This project analyzes the Heart Disease dataset from the UCI Machine Learning Repository. It includes preprocessing, 
model development, and evaluation to predict the presence of heart disease.

## 📁 Project Structure

- `data/`: Contains the raw data file (`heart.csv`)
- `code/`: Contains R scripts for each step
  - `01_preprocess.R`: Cleans and prepares the data
  - `02_model.R`: Trains classification model
  - `03_evaluation.R`: Evaluates model with metrics and plots
- `output/`: Contains generated outputs (plots, .rds files)
- `report/`: Contains the final `report.Rmd` and HTML output
- `Makefile`: Defines the pipeline to run everything with one command

## 📊 How to Generate the Final Report

In the terminal, run:

```bash
make


This will:

Preprocess the data

Train the model

Evaluate performance

Render the final HTML report at report/report.html

Author
Oceanus Zhang
