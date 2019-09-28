library(shinycssloaders)
ui <- shinyUI(fluidPage(
  
  titlePanel("withProgress を使った例"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1, max = 50, value = 30)
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
))

server <- shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    withProgress(message = "実行中です", {
      
      x    <- faithful[, 2]
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      for(i in 1:6){
        incProgress(1/6)
        Sys.sleep(1.0)
      }
      
      hist(x, breaks = bins, col = 'darkgray', border = 'blue')
    })
  })
})

shinyApp(ui = ui, server = server)