library(ggplot2)
library(reshape2)
library(plyr)
library(dplyr)
library(shiny)

# package (which generally comes preloaded).
data<-read.csv("shiny_buffer.csv")
#data<-read.csv("~/Dropbox/Works/R codes/MIT/Shiny/App-1/shiny_buffer.csv")

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Plot
  output$bufferPlot <- renderPlot(width="auto", height=800, {
    
    # Render a barplot
    taskdata<-subset(data, Task==input$task_name)
    colnumber <- which(colnames(data)==input$variable_name)
    taskdata[,colnumber] = round(taskdata[,colnumber], digits = 2)
    taskdata[,colnumber] = as.numeric(taskdata[,colnumber])

    ggplot(taskdata, aes(x=Car, y=eval(parse(text=input$variable_name)), label=eval(parse(text=input$variable_name))))+geom_point(aes(colour=Car), size=4)+theme_bw(16)+ theme(axis.text.x = element_text(angle = 45, hjust = 1))+
      ylab(input$variable_name)+geom_text(size=4, vjust=-1)+ggtitle(input$task_name)+scale_y_continuous(lim=c(0,2))

  })
})