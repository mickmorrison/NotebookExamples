# Load the required libraries
library(dplyr)
library(ggplot2)
library(sf)

# Demonstrating data manipulation with dplyr
# Load the mtcars dataset included with R
data("mtcars")
# Summarize the dataset by cylinder count, calculating average MPG and HP
mtcars_summary <- mtcars %>%
  group_by(cyl) %>%
  summarise(
    Avg_MPG = mean(mpg),
    Avg_HP = mean(hp)
  )
# Print the summary table
print(mtcars_summary)

# Data visualization with ggplot2
# Create a scatter plot of MPG vs. Horsepower, colored by number of cylinders
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(color=factor(cyl))) +
  labs(title="MPG vs. Horsepower", x="Horsepower", y="MPG", color="Cylinders") +
  theme_minimal()

# Introduction to spatial analysis with sf
# Load a sample spatial dataset (North Carolina county boundaries)
nc <- st_read(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
# Plot the spatial data
plot(st_geometry(nc))

# Example of working with historical spatial data
# Creating a simple dataframe of historical sites with name, latitude, longitude, and date established
historical_sites <- data.frame(
  name = c("Site A", "Site B", "Site C"),
  latitude = c(34.5, 35.2, 34.9),
  longitude = c(-77.5, -78.1, -77.7),
  established = c(500, 800, 450)
)
# Convert the dataframe to a spatial object, specifying coordinates and CRS (Coordinate Reference System)
historical_sites_sf <- st_as_sf(historical_sites, coords = c("longitude", "latitude"), crs = 4326)
# Plot the locations of the historical sites
plot(st_geometry(historical_sites_sf))
