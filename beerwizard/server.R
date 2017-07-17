#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)
library(ggjoy)
library(wordcloud)
library(tm)

# Load beer data
beers <- read.csv("/Users/Drazi/beerwizard/testdata.txt", stringsAsFactors = FALSE)
beer_ratings <- read.csv("/Users/Drazi/beerwizard/testdata_ratings.csv", stringsAsFactors = FALSE)
beer_ratings <- gather(beer_ratings)

# Wordcloud Stuff
test_corpus <- Corpus(DirSource("/Users/Drazi/beerwizard/test_corpra/"))
test_corpus <- tm_map(test_corpus, content_transformer(tolower))
test_corpus <- tm_map(test_corpus, removePunctuation)
test_corpus <- tm_map(test_corpus, removeNumbers)
test_corpus <- tm_map(test_corpus, removeWords, 
                      c('i', 'im', 'ive', 'look', 'smell', 'taste',
                        'feel', 'rdev', 'overall', 'beer', stopwords('english')))
test_corpus <- tm_map(test_corpus, stemDocument)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$brewery <- renderText(as.character(beers$brewery[2]))
   
  output$joyPlot <- renderPlot({ggplot(data = beer_ratings, 
                                        aes(x = value, y = key)) + geom_joy()})
  
  output$wordCloud <- renderPlot({wordcloud(test_corpus)})
  
  
})
