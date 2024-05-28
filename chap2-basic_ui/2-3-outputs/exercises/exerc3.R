library(shiny)
library(DT)

ui <- fluidPage(
  DTOutput("table")
)

server <- function(input, output, session) {
  output$table <- renderDT(mtcars, options = list(pageLength = 5, searching = FALSE,
                                                  ordering = FALSE, lengthChange = FALSE))
}

shinyApp(ui, server)