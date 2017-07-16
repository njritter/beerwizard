#
#

library(shiny)

# load beer data
beers <- read.csv("/Users/Drazi/beerwizard/testdata.txt")

# Define UI for application that draws beer profile
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Beer Wizard"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      selectInput("beer", "Select a Beer:", as.character(beers$name)),
      h3(textOutput("brewery")),
      
      plotOutput("joyplot")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("wordCloud")
    )
  )
))
