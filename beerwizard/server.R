#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(wordcloud)

# Load beer data
beers <- read.csv("/Users/Drazi/beerwizard/data/test_profiles/test_beer_info.txt")
cloud <- readRDS("/Users/Drazi/beerwizard/data/test_corpra/test_cloud.rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  vals <- reactiveValues()
  observe({
    vals$index <- grep(input$beer, beers$name)
  })
  
  output$brewery <- renderText({as.character(beers$brewery[vals$index])})
  output$rating <- renderText({as.numeric(beers$rating[vals$index])})
   
  output$wordCloud <- renderPlot({
    wordcloud(cloud[vals$index], max.words = 100, scale = c(10,1))
    })
  
  
})
