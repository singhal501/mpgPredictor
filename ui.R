library(shiny)

shinyUI(fluidPage(
  titlePanel("MPG Predictor App"),
  
  sidebarLayout(
    sidebarPanel(
      h4("Input car features below:"),
      sliderInput("wt", "Weight (1000 lbs):", min = 1, max = 6, value = 3, step = 0.1),
      sliderInput("hp", "Horsepower:", min = 50, max = 350, value = 150, step = 5),
      actionButton("goButton", "Predict MPG")
    ),
    
    mainPanel(
      h3("Predicted Miles per Gallon:"),
      verbatimTextOutput("predictedMPG"),
      plotOutput("mpgPlot"),
      br(),
      p("Created as part of the Johns Hopkins Data Science Specialization (Developing Data Products).")
    )
  )
))
