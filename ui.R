library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("The Iris Species Recognition App"),
  sidebarPanel(
    h3('Documentation'),
    h4('1. Measure the petals of the Iris specimen you found'),
    h4('2. Input the length and width (in centimeters) below. This should be a number between 0 and 10, e.g. 1.2'),
    h4('3. Press submit'),
    h4('4. The app will output wich species it is'),
    h3('Please input the size of the petals of your specimen'),
    numericInput('PetalLength', 'Petal Length in centimeters', 0, min=0, max=10, step=0.1),
    numericInput('PetalWidth', 'Petal Width in centimeters', 0, min=0, max=10, step=0.1),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Prediction of your species'),
    h4('You entered Petal Length:'), 
    verbatimTextOutput("petalLength"),
    h4('You entered Petal Width:'), 
    verbatimTextOutput("petalWidth"),
    h4('The species we predict based on these numbers is the following: '),
    verbatimTextOutput("prediction")
    )
  ))