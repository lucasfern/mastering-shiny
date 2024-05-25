library(shiny)
library(tidyverse)

datasets <- c("economics", "faithfuld", "seals")

ui <- fluidPage(
  # 1
  textInput("name", "What's your name?"),
  numericInput("age", "How old are you?", value = NA),
  
  textOutput("greeting"),
  
  # 2-4
  sliderInput("x", "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", "and y is", min = 1, max = 50, value = 5),
  "then, (x * y) is", textOutput("product"),
  "and, (x * y) + 5 is", textOutput("product_plus5"),
  "and (x * y) + 10 is", textOutput("product_plus10"),
  
  # 5
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)

server <- function(input, output) {
  # 1
  output$greeting <- renderText({
    paste0("Hello ", input$name)
  })
  
  product <- reactive({
    input$x * input$y
  })
  
  # 2-4
  output$product <- renderText({ 
    product()
  })
  output$product_plus5 <- renderText({ 
    product() + 5
  })
  output$product_plus10 <- renderText({ 
    product() + 10
  })
  
  # 5
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  output$summary <- renderPrint({
    summary(dataset())
  })
  output$plot <- renderPlot({
    plot(dataset())
  }, res = 96)
}

shinyApp(ui, server)
