library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("MIT AgeLab Glance Analysis Tool (MAGAT)"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with two inputs
      sidebarPanel(
        selectInput("task_name", "Task name:", 
                    c("Navigation entry (1st trial)" = "nav_entry_1",
                      "Navigation entry (2nd trial)" = "nav_entry_2",
                      "Navigation cancel (1st trial)" = "nav_cancel_1",
                      "Navigation cancel (2nd trial)" = "nav_cancel_2",
                      "Manual radio tuning (1st trial)" = "radiom_4",
                      "Manual radio tuning (2nd trial)" = "radiom_6"
                    )),
        
        selectInput("variable_name", "Variable name:", 
                    c("Mean of single off-road glance duration" = "mean_off_duration",
                      "Total off-road glance time" = "total_off_time",
                      "Percentage of long off-road glances" = "percentage_long_off_glance",
                      "Frequency of off-road glances per minute" = "frequency_off_glance_per_minute")),
        
        hr(),
        helpText("(details of technical reports and NHTSA guideline will be added here)")
        
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("glancePlot2"),  
        plotOutput("glancePlot")
      )
      
    )
  )
)