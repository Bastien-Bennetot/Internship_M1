# Explanation
Please find there all algorithm of my work. Here you can find a brief description of each algorithm.
## Compatibility
Compatibility is not garanteed, i am running on an Ubuntu LTS 16.04.
My software: Rstudio 1.0.136, R version 3.4.0 (2017-04-21), php 1:7.0+35ubuntu6.

## Algorithm
### PHP
amaniticae.php: Gather name of all Amanita species from amanitaceae.org
mushroom_observer_scraping_all_1.php: Data scraping of all fungi from mushroom observer. Extract for each observation the location (longitude, latitude, precision of the location, species name)
mushroom_observer_scraping_amanita_1.php: Data scraping of amanita from mushroom observer. Same content as above.

### Markdown
R_script_explained.Rmd: Preparation of all csv file. Cleaning and preparation of all data issued from different sources and php data scraping. Due to big file missing on the github this algorithm may not work. PLEASE USE .CSV on the github.
R_biodiversity_analysis.Rmd: Analysis of the biodiversity on worldmap
R_color_analysis.Rmd: Analysis of the correlation between color and climate and edaphic factors
R_observation_analysis.Rmd: Mapping of observation on the worldmap
R_range_map_analysis.Rmd: Plot of range map for each species
