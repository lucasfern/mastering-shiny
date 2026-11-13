#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  # 1
  textInput("nome", NULL, placeholder = "Nome completo"),
  
  # 2
  sliderInput("delivery_date", "When should we deliver?", value = as.Date("2020-09-17"),
              min = as.Date("2020-09-16"), max = as.Date("2020-09-23")),
  
  # 3
  sliderInput("number", "Selecione um número de 0 a 100:", value = 50, min = 0, max = 100,
              step = 5, animate = TRUE),
  
  # 4
  selectInput("wc_champions", "Selecione um país campeão do mundo",
              list("América do Sul" = c("Argentina", "Brasil", "Uruguai"),
                   "Europa" = c("Alemanha", "Espanha", "França", "Inglaterra", "Itália")))
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)