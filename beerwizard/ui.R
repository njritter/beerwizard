#
#

library(shiny)

# load beer data
beerInfo <- readRDS("beer_info.rds")

# Define UI for application that draws beer profile
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Beer Wizard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("beer", "Select a Beer:", as.character(beerInfo$name)),
      h4("Brewery"),
      textOutput("brewery"),
      h4("Style"),
      textOutput("style"),
      h4("User Rating"),
      textOutput("rating")
    ),
    
    mainPanel( 
      plotOutput("wordCloud")
    )
    
  )
))



