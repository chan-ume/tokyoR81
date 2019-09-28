library(shinycssloaders)
ui <- shinyUI(fluidPage(
  
  titlePanel("shinycssloaders を使った例"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1, max = 50, value = 30)
    ),
    
    mainPanel(
      withSpinner(plotOutput("distPlot"), type = 1, color.background = "white")
    )
  )
))

server <- shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    Sys.sleep(5.0)
    
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
})

shinyApp(ui = ui, server = server)