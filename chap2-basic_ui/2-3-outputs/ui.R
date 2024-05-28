fluidPage(
  textOutput("text"),
  verbatimTextOutput("code"),
  
  verbatimTextOutput("print"),
  
  tableOutput("static"),
  DTOutput("dynamic"),
  
  plotOutput("plot", width = "400px")
)
