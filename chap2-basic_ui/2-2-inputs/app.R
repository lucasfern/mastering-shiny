#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui <- fluidPage(

    sliderInput(inputId = "min", label = "Limit (minimum)", value = 50, min = 0, max = 100),
    
    textInput("name", "What's your name?"),
    passwordInput("password", "What's your password?"),
    textAreaInput("story", "Tell me about yourself", rows = 3),
    
    numericInput("num", "Number one", value = 0, min = 0, max = 100),
    sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
    sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100),
    
    dateInput("dob", "When were you born?", format = "dd/mm/yyyy", language = "pt-BR",
              daysofweekdisabled = c(0, 6), datesdisabled = c("2012-03-01", "2012-03-02")),
    dateRangeInput("holiday", "When do you want to go on vacation next?"),
    
    selectInput("state", "What's your favourite state?", state.name),
    selectInput("state2", NULL, c("Choose one" = "", state.name)),
    radioButtons("animal", "What's your favourite animal?", animals),
    
    radioButtons("rb", "Choose one:",
                 choiceNames = list(
                   icon("angry"),
                   icon("smile"),
                   icon("sad-tear")
                 ),
                 choiceValues = list("angry", "happy", "sad")
    ),
    
    selectInput(
      "state", "What's your favourite state?", state.name,
      multiple = TRUE
    ),
    
    checkboxGroupInput("animal", "What animals do you like?", animals),
    checkboxInput("cleanup", "Clean up?", value = TRUE),
    checkboxInput("shutdown", "Shutdown?"),
    
    fileInput("upload", NULL),
    
    actionButton("click", "Click me!"),
    actionButton("drink", "Drink me!", icon = icon("cocktail")),
    
    fluidRow(
      actionButton("click", "Click me!", class = "btn-danger"),
      actionButton("drink", "Drink me!", class = "btn-lg btn-success")
    ),
    fluidRow(
      actionButton("eat", "Eat me!", class = "btn-block")
    )
    
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application 
shinyApp(ui = ui, server = server)
