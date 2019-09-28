library(shiny)
shinyServer(function(input, output) {
  data_for_plot <- reactive({
    switch(input$selected_data_for_plot,
           "iris" = iris,
           "Boston" = Boston,
           "spam" = spam,
           "airquality" = airquality,
           "titanic" = data.frame(lapply(data.frame(Titanic), 
                                         function(i){rep(i, data.frame(Titanic)[, 5])}))
    )
  })
  
  output$table_for_plot <- DT::renderDataTable({
    data_for_plot()
  })
})