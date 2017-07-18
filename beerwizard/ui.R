#
#

library(shiny)

# load beer data
beers <- read.csv("/Users/Drazi/beerwizard/data/test_profiles/test_beer_info.txt")

# Define UI for application that draws beer profile
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Beer Wizard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("beer", "Select a Beer:", as.character(beers$name)),
      h4("Brewery"),
      textOutput("brewery"),
      h4("User Rating"),
      textOutput("rating")
    ),
    
    mainPanel( 
      plotOutput("wordCloud")
    )
    
  )
))



