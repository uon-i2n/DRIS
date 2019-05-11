#######################################################################
#                 New Futures Hackathon 2019                          #
#                      Disaster Resilience                            #
#---------------------------------------------------------------------#
# Group: Caterine, Barbara, Allan, Gabriel and Angelo                 #
#---------------------------------------------------------------------#
# filename: ui.R                                                      #                                                                 #
# Summary:                                                            #
#######################################################################

library(shinydashboard)
library(shiny)
library(maps)
library(ggmap)
library(leaflet)

# ui <- fluidPage(
#   
#   theme = shinytheme("flatly"),
#   tags$head(includeScript("C:\Users\c3273588\Desktop\Hackathon2019\google-analytics.js")),
#   tags$title("DRIS"),
#   
#   column(width = 12,
#          h1("Maps"),
#          HTML("<div class='alert alert-info'> Explain </div>")
#   ),
#   
#   # App painel 
#   sidebarLayout(sidebarPanel(
#     
#     # Painel direito de plotagem e tabela
#     mainPanel(tabsetPanel(type = "tabs",
#                           tabPanel("Maps - Demographics", plotlyOutput("maps")),
#                           tabPanel("Provision Assessment", dataTableOutput('resources_calc')),
#                           tabPanel("Registration of Supporting Points", plotlyOutput("registration_supp_points")),
#                           tabPanel("Registration of Suppliers", plotlyOutput("registration_supp")),),
#               helpText("To zoom in and out: click, drag and click twice on Decided Area"),
#               br(),
#               hr()))
# 
#    )
# )
#=====================================================================#
# End of UI
#=====================================================================#


  sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("Maps", tabName = "maps", icon = icon("map")),
      menuItem("Resources Calculation", icon = icon("table"), tabName = "resources_calc",
               badgeLabel = "new", badgeColor = "green"),
      menuItem("Registration of Disaster Support Hub", icon = icon("th"), tabName = "registration_supp_points"),
      menuItem("Registration of Suppliers", icon = icon("th"), tabName = "registration_supp")
    )
  )
  body <- dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(

      # Resources Calculation
      tabItem(tabName = "maps",
              #plotOutput(outputId="mapOut",
              #           width="100%", height="1000px",
               #          click = "plot_click"
              leafletOutput("mapOut")

      ),

      # Resources Calculation
      tabItem(tabName = "resources_calc", 
                h2("Provision Assessment"),
              dataTableOutput('resources')
      ),

      # Registration of Supporting Points
      tabItem(tabName = "registration_supp_points",
              h2("Registration of Disaster Support Hub"),
              textInput("n1", label = "Disaster Support Point"),
              textInput("n2", label = "Address"),
              textInput("n3", label = "Item"),
              textInput("n4", label = "Capacity of Storage"),
              textInput("n5", label = "Unit"),
              submitButton("Submit"),
              verbatimTextOutput("value")
      ),

      # Registration of Suppliers
      tabItem(tabName = "registration_supp",
              h2("Registration of Suppliers"),
              textInput("n6", label = "Supplier"),
              textInput("n7", label = "Address"),
              textInput("n8", label = "Item"),
              textInput("n9", label = "Supply Capacity"),
              textInput("n10", label = "Unit"),
              submitButton("Submit"),
              verbatimTextOutput("value2")
      )
    )
  )

  # Put them together into a dashboardPage
  dashboardPage(
    dashboardHeader(title = "DRIS: Disaster Resilience Intelligence Solution", titleWidth = 450),
    sidebar,
    body
  )