# Makefile

# Final output
all: report.html

# Build cleaned dataset
output/heart_clean.rds: code/01_preprocess.R data/processed.cleveland.data
	Rscript code/01_preprocess.R

# Build summary table
output/summary_table.rds: code/02_summary_table.R output/heart_clean.rds
	Rscript code/02_summary_table.R

# Build histogram plot
output/age_histogram.png: code/03_plot_distribution.R output/heart_clean.rds
	Rscript code/03_plot_distribution.R

# Final report
report.html: report/report.Rmd output/summary_table.rds output/age_histogram.png
	Rscript -e "rmarkdown::render('report/report.Rmd')"

# Clean outputs
clean:
	rm -f output/*.rds output/*.png report.html


