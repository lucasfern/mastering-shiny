fluidPage(
  numericInput("count", label = "Number of values", value = 100),
  
  textInput("name", "What's your name?"),
  textOutput("greeting"),
  
  # fluidRow(
  #   column(4, 
  #          "Distribution 1",
  #          numericInput("n1", label = "n", value = 1000, min = 1),
  #          numericInput("mean1", label = "µ", value = 0, step = 0.1),
  #          numericInput("sd1", label = "σ", value = 0.5, min = 0.1, step = 0.1)
  #   ),
  #   column(4, 
  #          "Distribution 2",
  #          numericInput("n2", label = "n", value = 1000, min = 1),
  #          numericInput("mean2", label = "µ", value = 0, step = 0.1),
  #          numericInput("sd2", label = "σ", value = 0.5, min = 0.1, step = 0.1)
  #   ),
  #   column(4,
  #          "Frequency polygon",
  #          numericInput("binwidth", label = "Bin width", value = 0.1, step = 0.1),
  #          sliderInput("range", label = "range", value = c(-3, 3), min = -5, max = 5)
  #   )
  # ),
  # fluidRow(
  #   column(9, plotOutput("hist")),
  #   column(3, verbatimTextOutput("ttest"))
  # ),
  
  fluidRow(
    column(3, 
           numericInput("lambda1", label = "lambda1", value = 3),
           numericInput("lambda2", label = "lambda2", value = 5),
           numericInput("n", label = "n", value = 1e4, min = 0),
           actionButton("simulate", "Simulate!")
    ),
    column(9, plotOutput("hist"))
  )
)
