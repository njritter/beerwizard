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
beerInfo <- readRDS("beer_info.rds")
tdm <- readRDS("tdm.rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  vals <- reactiveValues()
  observe({
    styles <- 
    vals$index <- grep(paste0("^", input$beer, "$"),beerInfo$name)
  })
  
  output$brewery <- renderText({as.character(beerInfo$brewery[vals$index])})
  output$style <- renderText({as.character(beerInfo$style[vals$index])})
  output$rating <- renderText({as.numeric(beerInfo$rating[vals$index])})
  
  output$wordCloud <- renderPlot({
    wordcloud(rownames(tdm), tdm[ ,vals$index], max.words = 100, 
              random.order = FALSE, scale = c(5,1))
    })
  
  
})
