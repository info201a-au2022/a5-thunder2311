
library(plotly)
c02 <-read.csv("owid-co2-data.csv", header = TRUE)

#This find the max co2 amount across all countries
find_max <- c02%>% 
  drop_na()%>% 
  filter(co2 == max(co2))%>% 
  pull(co2)

#This counts the population with the highest co2 rates
max_pop <- population%>% 
  drop_na()%>% 
  filter(population == max(population))%>% 
  pull(population)

#This finds the minimum or lowest number for co2 recorded across all countries
find_min <- c02%>% 
  drop_na()%>% 
  filter(co2 == min(co2))%>% 
  pull(co2)

server <- function(input, output) {
  output$resultPlot <- renderPlotly({
    plot1 <- ggplot(data = c02)+
      geom_col(mapping = aes(x = year, y = co2_growth_abs), color = input$color)+
      scale_x_continuous(limits = input$Year)
    
    return(plot1)
  })
}

