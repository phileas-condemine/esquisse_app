function(input, output, session) {
  
  data_r <- reactiveValues(data = iris, name = "iris")
  
  observe({
    req(input$data)
    path = input$data$datapath
    # browser()
    my_excel_file <- readxl::read_excel(path,sheet = input$sheet)
    my_excel_file <<- my_excel_file
    names(my_excel_file) <- gsub("( )|(-)","_",names(my_excel_file))
    names(my_excel_file) <- iconv(names(my_excel_file),from="UTF-8",to="ASCII//TRANSLIT")
    data_r$data <- my_excel_file
    data_r$name <- "my_excel_file"
  })
  
  output$sheets = renderUI({
    req(input$data)
    path = input$data$datapath
    
    selectInput(inputId = "sheet",label = "Onglet",choices = readxl::excel_sheets(path))
  })
  
  
  results <- esquisse_server(
    id = "esquisse",
    data_rv = data_r
  )
  
  output$code <- renderPrint({
    results$code_plot
  })
  
  output$filters <- renderPrint({
    results$code_filters
  })
  
  output$data <- renderPrint({
    str(results$data)
  })
  
}