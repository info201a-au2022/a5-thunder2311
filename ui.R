library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(shinythemes)
library(plotly)

c02 <-read.csv("owid-co2-data.csv", header = TRUE)

page_one <- tabPanel(
  "Introduction", 
  h2("Introduction"), 
  p("Carbon dioxide (CO2) is a greenhouse gas that is produced through the burning of fossil fuels such as coal, oil, and natural gas.
  CO2 emissions are a major contributor to climate change and have been increasing in recent years as a result of human activities.
  There have reported that reducing CO2 emissions is necessary to avoid the worst effects of climate change. 
  This can be achieved through a combination of measures, including transitioning to renewable energy sources, increasing energy efficiency, and reducing overall energy consumption.
  These visualization with show the effects and changes caused by co2 emissions across the world.")
  )

page_two <- tabPanel(
  "Co2 Graphs", 
  h2("Graph"), 
  sidebarLayout(
    sidebarPanel(
      sliderInput("Year", label = h3("Select Year"), min = 1750, sep = "", 
                  max = 2020, value = c(1750, 2020)),
      selectInput(
        inputId = "color", 
        label = "choose color",
        choices = c("Red", "Blue", "Purple")
      )
    ),
    
    mainPanel(
      plotlyOutput(outputId = "resultPlot")
    )
  )
)

ui <- navbarPage(
  tags$title("Co2 Emmissions"),
  page_one, 
  page_two
)
  
