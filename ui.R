

tagList(
  dashboardPage(
    tags$header(class = "main-header", span(class = "logo",style="background: #1263b3;", "Zonage ARS"),
                tags$nav(class = "navbar navbar-static-top",style="background: #0253a3;",
                         role = "navigation", span(shiny::icon("bars"), style = "display:none;"),
                         a(href = "#", class = "sidebar-toggle", `data-toggle` = "offcanvas",
                           role = "button", span(class = "sr-only", "Toggle navigation")),
                         div(class = "navbar-custom-menu",
                             tags$ul(class = "nav navbar-nav",
                                     # tags$li(downloadLink("dl_faq_hors_mg",HTML("<span><i class=\"fa fa-download\"></i> FAQ IDE-SF-MK-Ortho</span>"),style="color:#fff;"),
                                     #          class= 'dropdown'),
                                     tags$li(id="logo_ministere",
                                             a(tags$i(class="fa icon_ministere text-success vert_center"),"Solidarités Santé",href="http://solidarites-sante.gouv.fr/",
                                               target="_blank",  rel="noopener noreferrer",style="padding-top:5px;padding-bottom:5px")),
                                     tags$li(id="logo_drees",
                                             a(tags$i(class="fa icon_drees text-success vert_center"),"Développeur",href="http://drees.solidarites-sante.gouv.fr/etudes-et-statistiques/",
                                               target="_blank",  rel="noopener noreferrer",style="padding-top:5px;padding-bottom:5px")),
                                     # https://resizeimage.net/
                                     
                                     tags$li(id="Github",
                                             a(tags$i(class="fa icon_github text-success vert_center"),"Code Source",href="https://gitlab.com/DREES_code/formulaire_zonage_ars",
                                               target="_blank",  rel="noopener noreferrer",style="padding-top:5px;padding-bottom:5px")),
                                     tags$li(actionLink("logout","Déconnexion",icon=icon("sign-out-alt")),class= 'dropdown')
                             )))
                
                ,includeCSS("www/my_styles.css")
                # https://stackoverflow.com/questions/17966089/how-to-replace-and-with-lt-and-gt-with-jquery-or-js
                ,includeScript("www/custom_scripts.js")
                
                
                
                
                
    ),
    
    dashboardSidebar(collapsed = F,
                     sidebarMenu(id="sidebarmenu",
                                 menuItem(text = "Choix des données",tabName = "Main",
                                          icon = shiny::icon("gear")

                                 ),
                                 fileInput(
                                   inputId = "data", 
                                   label = "Ajouter ici un fichier Excel"
                                 ),
                                 uiOutput("sheets"),
                                 menuItem(text = "Résultat (code)",tabName = "Output",
                                          icon = shiny::icon("plane")
                                 )
                                 
                                 
                                 )
                     # ,includeHTML("www/logos.html")
                     # ,tags$img(src="Logo_Drees.jpg")
    ),
    dashboardBody(
      includeCSS("www/bootstrap-tour-standalone.min.css")
      ,includeScript("www/bootstrap-tour-standalone.min.js")
      ,includeScript("www/integration_bootstrap_tour.js")
      ,tabItems(
        tabItem(tabName = "Main",
                fluidRow(
                    esquisse_ui(
                      id = "esquisse", 
                      header = FALSE # dont display gadget title
                    )
                  )),
        tabItem(tabName = "Output",
                    title = "output",
                    tags$b("Code:"),
                    verbatimTextOutput("code"),
                    tags$b("Filters:"),
                    verbatimTextOutput("filters"),
                    tags$b("Data:"),
                    verbatimTextOutput("data")
                  )
        )
    )
  ),
  includeHTML("www/footer_accueil.html")
)
