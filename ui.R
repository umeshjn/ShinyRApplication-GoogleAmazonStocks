#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dygraphs)

# Define UI for application
shinyUI(fluidPage(
  
    # Application title
    titlePanel("Amazon vs Google - Stock Performance"),
    
    # Help text
    helpText("Drag the Time Range Selector at the bottom of the graph to vary the time of data selection"),
    
    # Line breaks
    br(), br(),
  
    # Show a plot of the generated distribution
    mainPanel(
      dygraphOutput("distPlot", width = "140%", height = "480px")
    )
))
