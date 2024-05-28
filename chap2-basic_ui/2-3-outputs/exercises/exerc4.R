library(shiny)
library(reactable)

ui <- fluidPage(
  reactableOutput("table")
)

server <- function(input, output, session) {
  output$table <-renderReactable({
    reactable(mtcars, defaultPageSize = 5, minRows = 5, searchable = TRUE)
  })
}

shinyApp(ui, server)