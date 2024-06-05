fluidPage(
  fluidRow(
    column(8,
      selectInput("code", "Product", choices = prod_codes, width = "100%")
    ),
    column(2, selectInput("y", "Y-axis", choices = c("rate", "count"))),
    # exerc 3
    column(2, numericInput("nrows", "Number of results", value = 5,
                           min = 1, max = 10))
  ),
  fluidRow(
    column(4, tableOutput("diag")),
    column(4, tableOutput("body_part")),
    column(4, tableOutput("location"))
  ),
  fluidRow(
    column(12, plotOutput("age_sex"))
  ),
  fluidRow(
    column(2, actionButton("story", "Tell me a story")),
    column(10, textOutput("narrative"))
  ),
  # exerc 4
  fluidRow(
    column(1, actionButton("previous_story", "Previous")),
    column(1, actionButton("next_story", "Next")),
    column(8, textOutput("narrative2"))
  )
)
