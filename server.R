#######################################################################
#                 New Futures Hackathon 2019                          #
#                      Disaster Resilience                            #
#---------------------------------------------------------------------#
# Group: Caterine, Barbara, Allan, Gabriel and Angelo                 #
#---------------------------------------------------------------------#
# filename: server.R                                                  #                                                                 #
# Summary:                                                            #
#######################################################################

server <- function(input, output, sesssion) {

  output$mapOut  <- renderLeaflet({
    df1 <- world.cities[world.cities$country.etc == "Australia",]
    
    leaflet(df1[, c("long","lat", "pop")]) %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%
      addCircleMarkers(~long, ~lat, popup = ~as.character(pop))
      #setView(lng = -93.85, lat = 37.45, zoom = 4)%>%
# geom_point(data = df1[, c("long","lat", "pop")] , aes(x=long, y = lat), colour ="red", shape = ".")
  })
  
  
  # output$mapOut <- renderPlot({
  #   
  #   df1 <- world.cities
  #   
  #   myMap <- get_map(location = c(-180, -84, 180, 85), zoom = 2)
  #   
  #   map <- ggmap(myMap) +
  #     geom_point(data = df1[, c("long","lat", "pop")] , aes(x=long, y = lat), colour ="red", shape = ".")
  #   map
  #   
  # })
  
  mydata = read.csv("C:/Users/c3273588/Desktop/Hackathon2019/StudyCase.csv") 

    
  output$resources <- renderDataTable(mydata)
  
  output$registration_supp_points <- renderImage({
    # Path to image
    #filename <- normalizePath(file.path('~/'))
    # Return a list containing the filename and alt text
    list(src = filename)
  }, deleteFile = FALSE)
  
  output$registration_supp <- renderImage({
    # Path to image
    #filename <- normalizePath(file.path('~/'))
    # Return a list containing the filename and alt text
    list(src = filename)
  }, deleteFile = FALSE)
  
  
  
}