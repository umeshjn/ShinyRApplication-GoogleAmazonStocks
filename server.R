#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)
library(dygraphs)

# Define server logic
shinyServer(function(input, output) {
   
  output$distPlot <- renderDygraph({
    
    #Get the data
    getSymbols(c("GOOG", "AMZN"), from = Sys.Date() - 365)
    
    #Combine the data
    GA <- cbind(GOOG[, 4], AMZN[, 4])
    
    #Plot the graph
    dygraph(GA, ylab = "Stock Price") %>% dySeries(label = "GOOGLE") %>% dySeries(label = "AMAZON") %>% dyLegend(show = "always") %>% dyRangeSelector() %>% dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha =0.2)
  })
  
})
