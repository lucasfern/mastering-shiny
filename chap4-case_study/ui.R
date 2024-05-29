fluidPage(
  fluidRow(
    column(8,
      selectInput("code", "Product", choices = prod_codes, width = "100%")
    ),
    column(2, selectInput("y", "Y-axis", choices = c("rate", "count")))
  ),
  fluidRow(
    column(4, tableOutput("diag")),
    column(4, tableOutput("body_part")),
    column(4, tableOutput("location"))
  ),
  fluidRow(
    column(12, plotOutput("age_sex"))
  )
)
