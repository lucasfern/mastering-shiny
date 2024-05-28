function(input, output, session) {
  output$text <- renderText("Hello friend!")
  output$code <- renderPrint(summary(1:10))
  
  output$print <- renderPrint("hello!")
  
  output$static <- renderTable(head(mtcars))
  output$dynamic <- renderDT(mtcars, options = list(pageLength = 5))
  
  output$plot <- renderPlot(plot(1:5), res = 96)
}

