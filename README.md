# Heart Disease Analysis Project

This repository contains an automated and reproducible analysis pipeline for exploring the Cleveland heart disease dataset. The report is rendered using R Markdown and includes data preprocessing, summary statistics, and visualizations.

---

## 📦 Project Structure

. ├── code/ # R scripts for each step of the pipeline ├── data/ # Raw data (processed.cleveland.data) ├── output/ # Generated intermediate files ├── report/ # Compiled final report (report.html) ├── renv/ # R package management files ├── Dockerfile # Docker image for reproducible analysis ├── Makefile # Automation rules ├── renv.lock # Package versions for reproducibility └── README.md # This file


---

## 🐳 Build Docker Image

To build the Docker image, run the following command from the root of the project directory:

```bash
docker build -t oc315/heart-disease-image .

🏃 Run Docker Container to Generate Report

Make sure you have an empty folder named report/ in the root of the repository. Then run:

bash
make docker_run

This command:

Launches a container from the oc315/heart-disease-image image

Mounts the local report/ folder to /home/rstudio/project/report in the container

Runs the make all target inside the container to generate the final report

When finished, the output report will appear in the local report/ folder as:

bash
report/report.html

⚠️ Notes for Windows Users
If you're using Git Bash on Windows, you may need to modify the path in the Makefile's docker_run rule:

make

docker run --rm -v "/$(pwd)/report:/home/rstudio/project/report" oc315/heart-disease-image make all

🌐 DockerHub Link
You can find the public Docker image here:

👉 https://hub.docker.com/r/oc315/heart-disease-image