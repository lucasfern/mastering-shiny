function(input, output, session) {
  selected <- reactive(injuries |> filter(prod_code == input$code))
  
  output$diag <- renderTable(
    count_top(selected(), diag, n = input$nrows), width = "100%"
  )
  
  output$body_part <- renderTable(
    count_top(selected(), body_part, n = input$nrows), width = "100%"
  )
  
  output$location <- renderTable(
    count_top(selected(), location, n = input$nrows), width = "100%"
  )
  
  summary <- reactive({
    selected() |> 
      count(age, sex, wt = weight) |> 
      left_join(population, by = c("age", "sex")) |> 
      mutate(rate = n / population * 1e4)
  })
  
  output$age_sex <- renderPlot({
    if (input$y == "count") {
      summary() |> 
        ggplot(aes(x = age, y = n, color = sex)) +
        geom_line() +
        labs(y = "Estimated number of injuries")
    } else {
      summary() |> 
        ggplot(aes(x = age, y = rate, color = sex)) +
        geom_line(na.rm = TRUE) +
        labs(y = "Injuries per 10,000 people")
    }
  }, res = 96)
  
  narrative_sample <- eventReactive(
    list(input$story, selected()),
    selected() |> pull(narrative) |> sample(1)
  )
  output$narrative <- renderText(narrative_sample())
  
  # exerc 4
  # Store the maximum posible number of stories.
  max_no_stories <- reactive(length(selected()$narrative))
  
  # Reactive used to save the current position in the narrative list.
  story <- reactiveVal(1)
  
  # Reset the story counter if the user changes the product code. 
  observeEvent(input$code, {
    story(1)
  })
  
  # When the user clicks "Next story", increase the current position in the
  # narrative but never go beyond the interval [1, length of the narrative].
  # Note that the mod function (%%) is keeping `current`` within this interval.
  observeEvent(input$next_story, {
    story((story() %% max_no_stories()) + 1)
  })
  
  # When the user clicks "Previous story" decrease the current position in the
  # narrative. Note that we also take advantage of the mod function.
  observeEvent(input$previous_story, {
    story(((story() - 2) %% max_no_stories()) + 1)
  })
  
  output$narrative2 <- renderText({
    selected()$narrative[story()]
  })
}
