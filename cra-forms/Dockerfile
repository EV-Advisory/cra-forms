FROM rocker/shiny:4.1.1
# Install R packages
RUN R -e "install.packages(c('rmarkdown', 'DT', 'DiagrammeR', 'dplyr', 'tidyverse', 'rvest', 'purrr'))"

# Copy the app files to the container
COPY forms.Rmd /srv/shiny-server/
COPY data /srv/shiny-server/data

# Set the working directory
WORKDIR /srv/shiny-server/

# Expose port 3838 for Shiny
EXPOSE 3838

# Run the app
CMD ["R", "-e", "rmarkdown::run('/srv/shiny-server/forms.Rmd', shiny_args = list(host = '0.0.0.0', port = 3838))"]
