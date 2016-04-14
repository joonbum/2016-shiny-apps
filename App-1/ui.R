library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("AgeLab Buffer Plotting Tool"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with two inputs
      sidebarPanel(
        selectInput("task_name", "Task name:", 
                    c("Manual radio tuning" = "Manual radio tuning",
                      "Manual radio preset" = "Manual radio preset",
                      "Manual phone dialing" = "Manual phone dialing",
                      "POI" = "POI",
                      "Voice radio tuning" = "Voice radio tuning",
                      "Voice radio preset" = "Voice radio preset",
                      "Voice phone dialing" = "Voice phone dialing",
                      "Voice address entry" = "Voice address entry",
                      "Voice navigation cancel" = "Voice navigation cancel",
                      "Baseline" = "Baseline"
                      )),
        
        selectInput("variable_name", "Variable name:", 
                    c("Buffer mean" = "Buffer_mean",
                      "Buffer SD" = "Buffer_SD",
                      "Buffer miminum" = "Buffer_min")),
                    
        hr(),
        helpText("Note: Buffer values were calculated by using AHEAD buffer V.1")
        
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("bufferPlot")  
      )
      
    )
  )
)