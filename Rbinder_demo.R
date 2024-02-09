library(shiny)
library(dplyr)
library(ggplot2)
library(sf)

# Define UI
ui <- fluidPage(
  titlePanel("Your App Title"),
  sidebarLayout(
    sidebarPanel(
      # Input: Specify any inputs like selectors or buttons here
    ),
    mainPanel(
      # Output: Place to show plots or tables
      plotOutput("plotMtcars"),
      plotOutput("plotSpatial")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Your data manipulation and plotting logic goes here
  
  # Example for mtcars plot
  output$plotMtcars <- renderPlot({
    ggplot(mtcars, aes(x=hp, y=mpg)) +
      geom_point(aes(color=factor(cyl))) +
      labs(title="MPG vs. Horsepower", x="Horsepower", y="MPG", color="Cylinders") +
      theme_minimal()
  })
  
  # Example for spatial plot
  output$plotSpatial <- renderPlot({
    nc <- st_read(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
    plot(st_geometry(nc))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
