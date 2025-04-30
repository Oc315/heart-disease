# Stage 1: Install R packages with renv
FROM --platform=linux/amd64 rocker/tidyverse AS base

WORKDIR /home/rstudio/project

# Copy renv files and lockfile
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

# Set renv cache
RUN mkdir -p renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

# Restore package environment
RUN R -e "install.packages('renv'); renv::restore()"

###### DO NOT MODIFY ABOVE THIS LINE ######

# Stage 2: Copy project and run report
FROM --platform=linux/amd64 rocker/tidyverse


WORKDIR /home/rstudio/project

# Copy renv and package env
COPY --from=base /home/rstudio/project/renv /home/rstudio/project/renv
COPY --from=base /home/rstudio/project/renv.lock /home/rstudio/project/renv.lock

# Copy rest of the project
COPY . .

# Set environment variable for R to render the report
ENV RENV_PATHS_CACHE=renv/.cache

# Run the report on container start
ENTRYPOINT ["make"]
