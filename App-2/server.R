library(ggplot2)
library(reshape2)
library(plyr)
library(dplyr)
library(shiny)

# package (which generally comes preloaded).
data<-read.csv("sumtable.csv")
#data<-read.csv("~/Dropbox/Works/R codes/MIT/Shiny/App-1/shiny_buffer.csv")

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Plot
  output$glancePlot <- renderPlot(width="auto", height="auto", {
    
    # Render a barplot
    taskdata<-subset(data, task==input$task_name)
    colnumber <- which(colnames(data)==input$variable_name)
    taskdata[,colnumber] = round(taskdata[,colnumber], digits = 2)
    taskdata[,colnumber] = as.numeric(taskdata[,colnumber])
   
    
    ggplot(taskdata, aes(x=car, y=eval(parse(text=input$variable_name))))+stat_summary(fun.y="mean", size=5, geom = "point",aes(colour=car))+theme_bw(16)+ 
      theme(axis.text.x = element_text(angle = 45, hjust = 1))+
      ylab(input$variable_name)+xlab("Systems")#+ggtitle(input$task_name)
    
  })
  output$glancePlot2 <- renderPlot(width="auto", height="auto", {
    
    # Render a barplot
    taskdata<-subset(data, task==input$task_name)
    colnumber <- which(colnames(data)==input$variable_name)
    taskdata[,colnumber] = round(taskdata[,colnumber], digits = 2)
    taskdata[,colnumber] = as.numeric(taskdata[,colnumber])
    
    
    ggplot(taskdata, aes(x=car, y=eval(parse(text=input$variable_name))))+stat_summary(fun.y="mean", size=5, geom = "bar",aes(fill=car),width=0.2)+theme_bw(16)+ 
      theme(axis.text.x = element_text(angle = 45, hjust = 1))+geom_jitter(width=0.2, alpha=I(.3))+
      ylab(input$variable_name)+xlab("Systems")#+ggtitle(input$task_name)
    
  })
})