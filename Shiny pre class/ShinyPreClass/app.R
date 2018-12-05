#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Frank DeVone Shiny"),
  
  numericInput(inputId = "Z","What is your z-value?",NA,0,4,step=.01),
  
  mainPanel("P-value"),
  
  verbatimTextOutput("Result")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  #output$Result<-renderPrint(2*pnorm(-abs(input$Z))) 
  output$Result<-renderPrint(pnorm(-abs(input$Z))) 
}

# Run the application 
shinyApp(ui = ui, server = server)

