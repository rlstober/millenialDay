# ui.R

shinyUI(fluidPage(
  titlePanel("Millenial Days"),
  
  sidebarPanel(
    
    fluidRow(
      dateInput("date", 
                label = h3("Enter your birthday (YYYY-MM-DD)"), 
                startview = "decade",
                value = "2014-01-01")
    ) #end fluid row
    
  ), #end side panel

  mainPanel(
    h4(" Today's Date is "),
    verbatimTextOutput("today"),
    tableOutput("mDays")
    )#end main panel
  
  
  ) # end fluid page
  ) # end shinbyUI