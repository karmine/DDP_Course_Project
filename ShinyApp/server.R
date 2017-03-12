
# Libraries required
library(shiny)
library(shinyjs)
library(shinythemes)
library(NbClust)
library(dendextend)
library(leaflet)


server <- function(input, output) {
        
        
        # Reset Button
        observeEvent(
                
                input$reset1, {
                
                        reset("data")
                        reset("distance")
                        reset("method")
                        reset("index")
                        
                }
                
        )
        
        # Reset Button
        observeEvent(
                
                input$reset2, {
                        
                        reset("location")
                        
                }
                
        )

        
        # Load dataset
        dir <- "data/spanish-university-repository.csv"
        frame <- read.csv(dir)
        
        # Load Icons for map
        dir <- "data/Icons"
        dir.icons <- paste(dir, "/", as.character(frame$acronym), ".png", sep = "")
        
        
        
        
        observeEvent(
                
                input$show1, {
         
                        # First table
                        output$table1 <- renderTable({
                                
                                frame1 <- data.frame(
                                        
                                        university = frame$university, 
                                        acronym = frame$acronym,
                                        type = frame$type
                                        
                                )
                                
                                frame1 <- cbind(frame1[1:20,], frame1[21:40,], frame1[41:60,])
                                frame1
                                
                        })
                        
                }
                
        )

        
        # First Plot
        output$plot1 <- renderPlot({

                if(input$data != "" && input$distance != "" && input$method != "" && input$index != "") {
                        
                        # Compute the optimal number of clusters
                        nb <- NbClust(scale(frame[, input$data]), distance = input$distance, min.nc = 4, 
                                      max.nc = 20, method = input$method, index = input$index)
                        
                        
                        partition <- nb$Best.partition
                        optimum <- max(partition)
                        
                        
                        # Plot optimum number of clusters in dendrogram
                        d <- dist(scale(frame[, input$data]), method = input$distance)
                        h <- hclust(d, method = input$method)
                        c <- as.dendrogram(h)
                        labels(c) <- as.character(frame$acronym)[h$order]
                        labels_colors(c) <- sample(palette(rainbow(optimum)))[partition][h$order]
                        title <- paste("Cluster dendrogram of ", input$data, " with ", optimum, " optimum partitions", " calculated with ", input$index, " index", sep = "")
                        
                        plot(c, ylab = "Heigh", main = title)
                        rect.hclust(h, k = optimum, border = "snow4") # look at Day.Name

                }

        })
       

        # Second table: Ranking
        observeEvent(
                
                input$show2, {
                        
                        output$table2 <- renderTable({
                                
                                if(input$data != "") {
                                        
                                        decreasing <- FALSE
                                        if(input$data != "ranking.alexa" & input$data != "ranking.rwwu") decreasing <- TRUE
                                        position <- order(frame[, input$data], decreasing = decreasing)
                                        frame2 <- frame[position, c("acronym", input$data)]
                                        names(frame2)[1] <- "university"
                                        row.names(frame2) <- frame2$ranking <- c(1:60)
                                        
                                        frame2 <- cbind(frame2[1:20,], frame2[21:40,], frame2[41:60,])
                                        frame2
                                        
                                }
                                
                        })
                        
                }
                
        )
        
        
        
        
        # Second plot
        output$plot2 <- renderLeaflet({
                
                # Location
                position <- c(1:60)
                if(input$location != "All") position <- which(frame$acronym == input$location)
                
                
                icons <-  makeIcon( iconUrl = dir.icons[position], 
                                    iconWidth = 31*215/230, 
                                    iconHeight = 31,
                                    iconAnchorX = 31*215/230/2, 
                                    iconAnchorY = 16)
                
                
                name <- paste(as.character(frame$university[position]), 
                              " (", as.character(frame$acronym[position]), ")", sep = "")
                
                
                content <- paste(name, "</b><br/>","<b><a href='", frame$url.university[position], "'>", "University Web", "</a></b><br/>",
                                 "<b><a href='", frame$url.repository[position], "'>", "Repository Web", "</a></b><br/>")
                
                
                map <- addMarkers(addTiles(leaflet()), 
                           icon = icons, 
                           popup = content, 
                           lat = as.numeric(frame$latitude[position]), 
                           lng = as.numeric(frame$longitude[position]))
                
                map
                
        })
        
}


