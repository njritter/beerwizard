#
#

library(shiny)

# load beer data
beers <- read.csv("/Users/Drazi/beerwizard/testdata.txt")

# Define UI for application that draws beer profile
shinyUI(fluidPage(
  
  # Application title
  title = "Beer Wizard",
  
  fluidRow(
    column(4, 
           h3("Beer Wizard"),
           selectInput("beer", "Select a Beer:", as.character(beers$name))
           ),
           
    column(8, 
           plotOutput("wordCloud", width = "100%")
           )
  ),
  
  hr(), # Horizontal Line Break
  
  fluidRow( # Row 2 with Additional Stats
    column(4,
           plotOutput("joyPlot")
  )
  
    )
  )
)
