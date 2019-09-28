library(shiny)

shinyServer(function(input, output, session) {
  observe({
    if (input$input_radio_button == "Tokyo") {
      choiceList = c("Shinjuku", "Shibuya", "Shinagawa")
    } else {
      choiceList = c("Maebashi", "Takasaki", "Kiryu")
    }
    updateSelectInput(session, "choices",
                      label = "Select input label",
                      choices = choiceList)
  })
})