library(shiny)
library(ggplot2)

# Train simple linear model using mtcars
model <- lm(mpg ~ wt + hp, data = mtcars)

shinyServer(function(input, output) {
  
  # Reactive expression for predicted value
  predicted <- reactive({
    input$goButton
    isolate({
      wt <- input$wt
      hp <- input$hp
      predict(model, newdata = data.frame(wt = wt, hp = hp))
    })
  })
  
  # Display predicted MPG
  output$predictedMPG <- renderPrint({
    round(predicted(), 2)
  })
  
  # Display plot
  output$mpgPlot <- renderPlot({
    ggplot(mtcars, aes(x = wt, y = mpg)) +
      geom_point(color = "blue") +
      geom_smooth(method = "lm", se = FALSE, color = "red") +
      geom_point(aes(x = input$wt, y = predicted()), color = "green", size = 4) +
      labs(title = "MPG vs Weight",
           x = "Weight (1000 lbs)",
           y = "Miles per Gallon (MPG)") +
      theme_minimal()
  })
})
