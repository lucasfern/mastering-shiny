function(input, output, session) {
  string <- reactive(paste0("Hello ", input$name, "!"))
  output$greeting <- renderText(string())
  
  observeEvent(input$name, {
    message("Greeting performed")
  })
  
  # x1 <- reactive(rnorm(input$n1, input$mean1, input$sd1))
  # x2 <- reactive(rnorm(input$n2, input$mean2, input$sd2))
  # 
  # output$hist <- renderPlot({
  #   freqpoly(x1(), x2(), binwidth = input$binwidth, xlim = input$range)
  # }, res = 96)
  # 
  # output$ttest <- renderText({
  #   t_test(x1(), x2())
  # })
  
  # x1 <- reactive(rpois(input$n, input$lambda1))
  # x2 <- reactive(rpois(input$n, input$lambda2))
  
  # timer <- reactiveTimer(500)
  # 
  # x1 <- reactive({
  #   timer()
  #   rpois(input$n, input$lambda1)
  # })
  # x2 <- reactive({
  #   timer()
  #   rpois(input$n, input$lambda2)
  # })
  
  # x1 <- reactive({
  #   input$simulate
  #   rpois(input$n, input$lambda1)
  # })
  # x2 <- reactive({
  #   input$simulate
  #   rpois(input$n, input$lambda2)
  # })
  
  x1 <- eventReactive(input$simulate, {
    rpois(input$n, input$lambda1)
  })
  x2 <- eventReactive(input$simulate, {
    rpois(input$n, input$lambda2)
  })
  
  output$hist <- renderPlot({
    freqpoly(x1(), x2(), binwidth = 1, xlim = c(0, 40))
  }, res = 96)
}
