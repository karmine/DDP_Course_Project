
# Libraries required
library(shiny)
library(shinyjs)
library(shinythemes)
library(NbClust)
library(dendextend)
library(leaflet)


ui <- fluidPage(
        
        useShinyjs(),
        
        theme = shinytheme("cerulean"),
        
        fluidRow(
                
                column(
                        
                        2, 
                        tags$img(
                                
                                height = 100,
                                width = 100,
                                src = "Coursera.png"
                                
                        )
                        
                ),
                
                column(
                        
                        8,
                        headerPanel("Clustering, Ranking and Location of Spanish Universities with Repositories on Web")
                        
                        
                ),
                
                column(
                        
                        2, 
                        tags$img(
                                
                                height = 100,
                                width = 100,
                                src = "DDP.png"
                                
                        )
                        
                )
                
        ),
        
        hr(),
        
        h4("There are in total 82 spanish universities, 60 with institutional repositories on web. This application works with this 60 group."),
        h4("You can explore different data from universities and theirs institutional repositories with Hiecharchical Clustering Method using NBClust Criterion 
           to calculate the optimum number of cluster partitions."),
        h4("The application shows the ranking of the universities based on data selected."), 
        h4("Also, you can locate the university you want on map, with icon links to the web pages of both, university and institutional repository."),
        
        hr(),
        
        h4("Press the button to show the university names and their acronym names."),
        
        actionButton(
                        
                inputId = "show1",
                label = "Show Table"
                        
        ),
        
        tableOutput("table1"),
        
        hr(),
        
        h4("Use the boxes to explore the data with Hiecharchical Clustering Method using NBClust criterion to calculate the optimum number of cluster partitions."),
        h4("You must select the data you want to cluster (7 different data), the distance metric (5 different distances), the method link (6 methods) and the index 
            of the NbClust algorithm (30 different index)."),
        
        fluidRow(
                
                column(
                        
                        3,
                        
                        actionButton(
                                
                                inputId = "reset1",
                                label = "Clear"
                                
                        ),
                        
                        selectInput(
                                
                                inputId = "data",
                                label = "Select Clustering Data",
                                choices = c("", "fundation", "number.professor", "number.student", 
                                            "size.university","size.repository", 
                                            "ranking.rwwu", "ranking.alexa"),
                                selected = ""
                                
                        ),
                        
                        selectInput(
                                
                                inputId = "distance",
                                label = "Select Clustering Distance Metric",
                                choices = c("", "canberra", "euclidean", 
                                            "manhattan", "maximum", "minkowski"),
                                selected = ""
                                
                        ),
                        
                        selectInput(
                                
                                inputId = "method",
                                label = "Select Clustering Method",
                                choices = c("", "single", "complete", "average", 
                                            "mcquitty", "median", "centroid"),
                                selected = ""
                                
                        ),
                        
                        selectInput(
                                
                                inputId = "index",
                                label = "Select Clustering Index",
                                choices = c("", "kl", "ch", "hartigan", "ccc", "scott", "marriot", "trcovw", 
                                            "tracew", "friedman", "rubin", "cindex", "db", "silhouette", 
                                            "duda", "pseudot2", "beale", "ratkowsky", "ball", "ptbiserial", 
                                            "gap", "frey", "mcclain", "gamma", "gplus", "tau", "dunn", 
                                            "hubert", "sdindex", "dindex", "sdbw"),
                                selected = ""
                                
                        )
                        
                ),
                
                column(
                        
                        9,
                        
                        plotOutput("plot1")
                        
                )
                
        ),
        
        
        hr(),
        
        h4("Press the button to show the ranking table based on data clustering selected."),
        
        actionButton(
                
                inputId = "show2",
                label = "Show Table"
                
        ),
        
        tableOutput("table2"),
        
        hr(),
        
        h4("Use the box to locate the university you want to."),
        
        actionButton(
                
                inputId = "reset2",
                label = "Clear"
                
        ),
        
        fluidRow(
                
                column(
                        
                        1
                        
                ),
                
                column(
                                
                        11,
                        
                        selectInput(
                                
                                inputId = "location",
                                label = "Select University to Locate",
                                choices = c("All", "UOC", "UAB", "UAM", "UC3M", "UCAM", "CEU", "UCM",
                                        "UAH", "UA", "UAL", "UB", "UBU", "UCA", "UNICAN", "UCLM",
                                        "UCO", "DEUSTO", "UNEX", "UDG", "UGR", "UHU", "UJAEN",
                                        "UDC", "ULL", "UIB", "ULPGC", "UNILEON", "UDL", "EHU",
                                        "UMA", "UM", "UNAV", "UNIOVI", "USAL", "USC", "US", "UV", 
                                        "UVA", "UVIC", "UVIGO", "UNIZAR", "UE", "UFV", "UNIA",      
                                        "UIC", "UNIR", "UJI", "UMH", "UNED", "UPO", "UPCT", 
                                        "UPC", "UPM", "UPV", "UPF", "UPCOMILLAS", "UPSA", 
                                        "UNAVARRA", "URJC", "URV"),
                                selected = "All"
                                
                        )
                        
                )
                
        ), 
                        
        leafletOutput("plot2"),
        
        hr(),
        
        fluidRow(
                
                h6("Application made by Sergio Contador scontador@ucm.es")
                
        )
        
)


