library(shiny)

# calculating the most probable species of iris, based on input sizes
predictSpecies <- function(petalLength,petalWidth) {
  ifelse (petalLength == 0 | petalWidth == 0,
          'Please enter non-zero values',
  ifelse (petalLength <= 2.5 & petalLength >= 0.8 & petalWidth <= 0.8,
          'You found an Iris Setosa',
  ifelse (petalLength >= 4.4 & petalLength <= 5.25 & petalWidth >= 1.45 & petalWidth <= 1.75,
          'You found a tricky one; it can be either an Iris Versicolor or an Iris Virginica',
  ifelse (petalLength >= 2.5 & petalLength <= 5.25 & petalWidth >= 0.9 & petalWidth <= 1.75,
          'You found an Iris Versicolor',
  ifelse (petalLength >= 4.4 & petalLength <= 7.5 & petalWidth >= 1.25 & petalWidth <= 2.75,
          'You found an Iris Virginica',
  'The specimen you found does not match any of the known Iris species. You may have discovered a new species! Eternal fame could be yours.'
  )))))
}

shinyServer(
  function(input,output) {
    # printing the conclusion of the calculation to the screen
    output$petalLength <- renderPrint(input$PetalLength)
    output$petalWidth <- renderPrint(input$PetalWidth)
    output$prediction <- renderPrint(predictSpecies(input$PetalLength,input$PetalWidth))
  }
)