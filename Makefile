# Final output
all: report/report.html

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
report/report.html: report/report.Rmd output/summary_table.rds output/age_histogram.png
	Rscript -e "rmarkdown::render('report/report.Rmd', output_file = 'report.html', output_dir = 'report')"

# Clean outputs
clean:
	rm -f output/*.rds output/*.png report/*.html

# Build image
docker_build:
	docker build -t heart_disease_image .

# Run container and generate report
docker_run:
	docker run --rm -v "$(PWD)/report:/home/rstudio/project/report" heart_disease_image

# Windows version
docker_run:
	docker run --rm -v "$(pwd)/report:/home/rstudio/project/report" heart_disease_image



