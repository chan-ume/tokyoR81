library(shiny)
shinyServer(function(input, output, session) {
  data_for_plot <- reactive({
    data <- switch(input$selected_data_for_plot,
           "iris" = iris,
           "Boston" = Boston,
           "spam" = spam,
           "airquality" = airquality,
           "titanic" = data.frame(lapply(data.frame(Titanic), 
                                         function(i){rep(i, data.frame(Titanic)[, 5])}))
    )
    updateSelectInput(session, "select_input_data_for_hist", choices = colnames(data))
    data
  })
  
  output$histgram <- renderPlot({
    input$trigger_histogram
    
    tmpData <- isolate(data_for_plot())[, isolate(input$select_input_data_for_hist)]
    x <- na.omit(tmpData)
    bins <- seq(min(x), max(x), length.out = isolate(input$slider_input_data) + 1)
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  output$table_for_plot <- DT::renderDataTable({
    data_for_plot()
  })
})