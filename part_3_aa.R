# _________________
# Amy Anderson
# _________________


# Attach packages
library(tidyverse)
library(janitor)
library(here)



# Read in data:
db <- read_csv(here::here("data", "disease_burden.csv")) %>%
  clean_names() %>%
  rename(deaths_per_100k = death_rate_per_100_000)  #oh! you don't have to use "" around arguments for rename()



# Create a subset, then graph:
  db_sub <- db %>%
    filter(country_name %in% c("Afghanistan", "United States", "Somalia", "Japan")) %>%
    filter(age_group == "0-6 days", sex == "Both")

# Create a basic line graph
db_plot <- ggplot(data = db_sub, aes(x = year, y = deaths_per_100k)) +
  geom_line(aes(color = country_name))

db_plot
