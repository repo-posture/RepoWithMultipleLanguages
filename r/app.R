# app.R - A Shiny web application for SBOM testing
# Uses various R packages listed in the DESCRIPTION file

# Load required libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(tidyr)
library(stringr)
library(lubridate)
library(httr)
library(jsonlite)

# Sample data
users <- data.frame(
  id = 1:3,
  name = c("Alice", "Bob", "Charlie"),
  email = c("alice@example.com", "bob@example.com", "charlie@example.com"),
  registration_date = as.Date(c("2023-01-15", "2023-02-20", "2023-03-25"))
)

# Process data with dplyr
user_stats <- users %>%
  mutate(
    days_since_registration = as.integer(difftime(Sys.Date(), registration_date, units = "days")),
    name_length = stringr::str_length(name),
    email_domain = stringr::str_extract(email, "@[^.]+\\.[^.]+$")
  ) %>%
  arrange(desc(days_since_registration))

# Define UI
ui <- fluidPage(
  titlePanel("SBOM Test R Application"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Controls"),
      selectInput("plot_type", "Plot Type:", 
                  choices = c("Bar Chart" = "bar", "Scatter Plot" = "scatter")),
      actionButton("refresh_data", "Refresh External Data")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Users", 
                 h3("User Data"),
                 tableOutput("user_table"),
                 h4("User Statistics"),
                 verbatimTextOutput("user_stats")),
        
        tabPanel("Visualizations",
                 h3("Data Visualization"),
                 plotOutput("data_plot"),
                 verbatimTextOutput("plot_info")),
        
        tabPanel("External Data",
                 h3("External API Data"),
                 verbatimTextOutput("api_data"))
      )
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  # External data reactive value
  external_data <- reactiveVal(NULL)
  
  # Initialize with some external data
  observe({
    tryCatch({
      response <- httr::GET("https://jsonplaceholder.typicode.com/posts/1")
      if (httr::status_code(response) == 200) {
        data <- content(response, "parsed")
        external_data(data)
      }
    }, error = function(e) {
      print(paste("Error fetching external data:", e$message))
    })
  })
  
  # Refresh external data when button is clicked
  observeEvent(input$refresh_data, {
    tryCatch({
      response <- httr::GET("https://jsonplaceholder.typicode.com/posts/1")
      if (httr::status_code(response) == 200) {
        data <- content(response, "parsed")
        external_data(data)
        showNotification("Data refreshed successfully!", type = "message")
      }
    }, error = function(e) {
      showNotification(paste("Error:", e$message), type = "error")
    })
  })
  
  # Display user table
  output$user_table <- renderTable({
    users
  })
  
  # Display user stats
  output$user_stats <- renderPrint({
    summary(user_stats)
  })
  
  # Display plot
  output$data_plot <- renderPlot({
    if (input$plot_type == "bar") {
      # Create bar chart using ggplot2
      ggplot(user_stats, aes(x = name, y = days_since_registration)) +
        geom_bar(stat = "identity", fill = "steelblue") +
        labs(title = "Days Since Registration by User",
             x = "User Name", y = "Days Since Registration") +
        theme_minimal()
    } else {
      # Create scatter plot using ggplot2
      ggplot(user_stats, aes(x = days_since_registration, y = name_length)) +
        geom_point(aes(color = name), size = 5) +
        labs(title = "Name Length vs. Days Since Registration",
             x = "Days Since Registration", y = "Name Length") +
        theme_minimal()
    }
  })
  
  # Display plot info
  output$plot_info <- renderPrint({
    cat("Plot Type:", input$plot_type, "\n")
    cat("Generated at:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n")
  })
  
  # Display external API data
  output$api_data <- renderPrint({
    data <- external_data()
    if (is.null(data)) {
      cat("No data available. Click 'Refresh External Data'.")
    } else {
      str(data)
    }
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
