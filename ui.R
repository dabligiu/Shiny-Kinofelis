library(scales)
library(shiny)
library(DT)
library(ggplot2)
#library(googlesheets)

ui<-navbarPage(
  "Kinofelis PWP",
      
               tabPanel("Home",
                        
                        wellPanel(
                          tags$style(type="text/css", '#leftPanel { width:100%; float:left;}'),
                          id = "leftPanel",
                            h1("Welcome to the reporting Platform of Kinofelis Public Works Programs. Reports are currently
                           available for the phases of the 17 and 34. Please click on the tabs
                           at the top to browse through the reports.", 
                           style = "font-family: 'Arial';
        font-weight: normal;  text-align: Left;
        color: #1B1616; font-size: 115%;")),width = 1,
                        sidebarPanel(
                          tags$style(type="text/css", '#reo { position:fixed; right:2%; bottom:2%;}'),
                          id = "reo",
                          "Contact mail: avgeris@gmail.com",width = 3 )),
               navbarMenu("17 Municipalities, Applicant/Beneficiary Reports",
                          tabPanel("Gender",
                                   sidebarLayout(
                                     sidebarPanel(
                                       radioButtons("datatype2", "Data for",
                                                    c("All Applicants"="a", "Succesful Applicants"="b")
                                       ),
                                       selectInput("munic", "Municipality:",choices = c("All","Agioi Anargiroi-Kamatero",
                                                                                        "Agrinio", "Ampelikopoi - Menemeni","Argos-Mikines","Arta", "Aspropirgos",
                                                                                        "Paionia", "Perama", "Pavlos Melas", "Kalamaria", "Keratsini-Drapetsona",
                                                                                        "Thermaikos", "Kordelio-Eyosmos", "Korinthos", "Salamina","Sintikis","Filis"), selected = 1
                                       ),
                                       width = 3),
                                     mainPanel(
                                       plotOutput('gendertable2', height = "auto"),
                                       DT::dataTableOutput('gendertable')
                                     )
                                   )),
                          tabPanel("SSI Overlap",
                                   sidebarLayout(
                                     sidebarPanel(
                                       radioButtons("datatype3", "Data for",
                                                    c("All Applicants"="a", "Succesful Applicants"="b")
                                       ),
                                       selectInput("munic2", "Municipality:",choices = sort(c("All","Agioi Anargiroi-Kamatero",
                                                                                         "Agrinio", "Ampelikopoi - Menemeni","Argos-Mikines","Arta", "Aspropirgos",
                                                                                         "Paionia", "Perama", "Pavlos Melas", "Kalamaria", "Keratsini-Drapetsona",
                                                                                         "Thermaikos", "Kordelio-Eyosmos", "Korinthos", "Salamina","Sintikis","Filis")) , selected = "All"
                                       ),
                                       width = 3),
                                     mainPanel(
                                       plotOutput('gmitable2', height = "auto"),
                                       DT::dataTableOutput('gmitable')
                                     )
                                   )),
                          tabPanel("Age",
                                   sidebarLayout(
                                     sidebarPanel(
                                       radioButtons("datatype", "Data for",
                                                    c("All Applicants"="a", "Succesful Applicants"="b")
                                       ),
                                       selectInput("munic3", "Municipality:",choices = sort(c("All","Agioi Anargiroi-Kamatero",
                                                                                         "Agrinio", "Ampelikopoi - Menemeni","Argos-Mikines","Arta", "Aspropirgos",
                                                                                         "Paionia", "Perama", "Pavlos Melas", "Kalamaria", "Keratsini-Drapetsona",
                                                                                         "Thermaikos", "Kordelio-Eyosmos", "Korinthos", "Salamina","Sintikis","Filis")), selected = 1
                                       ),
                                       width = 3),
                                     mainPanel(
                                       plotOutput('agetable'),
                                       DT::dataTableOutput('agetable2')
                                     )
                                   )),
                          tabPanel("Educational Level",
                                   sidebarLayout(
                                     sidebarPanel(
                                       selectInput("munic4", "Municipality:",choices = sort(c("All","Agioi Anargiroi-Kamatero",
                                                                                         "Agrinio", "Ampelikopoi - Menemeni","Argos-Mikines","Arta", "Aspropirgos",
                                                                                         "Paionia", "Perama", "Pavlos Melas", "Kalamaria", "Keratsini-Drapetsona",
                                                                                         "Thermaikos", "Kordelio-Eyosmos", "Korinthos", "Salamina","Sintikis","Filis")), selected = "All"
                                       ),
                                       width = 3),
                                     mainPanel(
                                       fluidRow(
                                         column(12,"DE = Secondary Education , TE = Technical Education ,
                                          YE = Mandatory Education, PE = University Education",
                                          fluidRow( 
                                            splitLayout(cellWidths = c("50%", "50%"),
                                            plotOutput('edlvl'),
                                            plotOutput('edlvl2'))
                                          ),
                                          
                                          fluidRow( 
                                            splitLayout(cellWidths = c("50%", "50%"),
                                             DT::dataTableOutput('edlvl3'),
                                              DT::dataTableOutput('edlvl4'))
                                          )
                                        )
                                     )
                                     )
                                )),
                          tabPanel("Educational Under/Over Reporting",
                                   sidebarLayout(
                                     sidebarPanel(
                                       selectInput("munic6", "Municipality:",choices = sort(c("All","Agioi Anargiroi-Kamatero",
                                                                                         "Agrinio", "Ampelikopoi - Menemeni","Argos-Mikines","Arta", "Aspropirgos",
                                                                                         "Paionia", "Perama", "Pavlos Melas", "Kalamaria", "Keratsini-Drapetsona",
                                                                                         "Thermaikos", "Kordelio-Eyosmos", "Korinthos", "Salamina","Sintikis","Filis")), selected = "All"
                                       ),
                                       width = 3),
                                     mainPanel(
                                       fluidRow(
                                         column(12,"Data were compiled based on what educational level the applicant has registered with in OAED vs 
                                                    what she applied with for Kinofelis.As such someone is found as Over-qualified when she applies
                                                    for a Kinofelis position that has a lower educational demand than what she has registered in OAED and vice versa.
                                                    Not Known stands for cases where the applicant had no prior educational level registration with OAED so comparison cant be made.",
                                                fluidRow( 
                                                  splitLayout(cellWidths = c("50%", "50%"),
                                                              plotOutput('edund'),
                                                              plotOutput('edund2'))
                                                ),
                                                
                                                fluidRow( 
                                                  splitLayout(cellWidths = c("50%", "50%"),
                                                              DT::dataTableOutput('edund3'),
                                                              DT::dataTableOutput('edund4'))
                                                )
                                         )
                                     )
                                   )
                                   )),
                          tabPanel("Unemployment Profile",
                                   sidebarLayout(
                                     sidebarPanel(
                                       radioButtons("datatype4", "Data for",
                                                    c("All Applicants"="a", "Succesful Applicants"="b")
                                       ),
                                       selectInput("munic5", "Municipality:",choices = sort(c("All","Agioi Anargiroi-Kamatero",
                                                                                         "Agrinio", "Ampelikopoi - Menemeni","Argos-Mikines","Arta", "Aspropirgos",
                                                                                         "Paionia", "Perama", "Pavlos Melas", "Kalamaria", "Keratsini-Drapetsona",
                                                                                         "Thermaikos", "Kordelio-Eyosmos", "Korinthos", "Salamina","Sintikis","Filis")), selected = "All"
                                       ),
                                       selectInput("age", "Age Group:",choices = c("All","16-25","26-35",
                                                                                         "36-45", "46-55","56-65","66+"), selected = 1
                                       ),
                                       width = 3),
                                     mainPanel(
                                       fluidRow( 
                                         plotOutput('uneage'),
                                         DT::dataTableOutput('unemp2')
                                       )
                                     )
                                   ))
               ),
              navbarMenu( "34 Municipalities, Applicant/Beneficiary Reports",
                          tabPanel("SSI Overlap",
                            sidebarLayout(
                              sidebarPanel(
                                 radioButtons("datatype34a", "Data for",
                                   c("All Applicants"="a", "Succesful Applicants"="b")
                                 ),
                                 selectInput("munic34a", "Municipality:",choices = sort(c("All","Xalkidona","Acharxnes","Agia Varvara","Delta","Veroia","Aigaleo","Aleksandria",
                                                                                     "Grevena","Drama","Ilida","Patra","Petroupoli","Preveza","Pirgos","Lebadeon","Lagadas",
                                                                                     "Lamia","Karditsa","Layreotiki","Thessaloniki","Kastoria","Kilkis","Iliou","Kozani","Kimi-Aliberi",
                                                                                     "Megara","Neapoli-Sikies","Xanthi","Xalkidonos","Naypaktia","Nikaia-Agios Ioannis-Renti","Orestiada","Florina",
                                                                                     "Trikala")), selected = "All"
                                 ),
                                 width = 3),
                                 mainPanel(
                                   plotOutput('SSI34', height = "auto"),
                                   DT::dataTableOutput('SSI34b')  
                                 )
                              )
                            )
                ),
  navbarMenu( "325 Municipalities, Projects",
              tabPanel("Project Categories",
                       sidebarLayout(
                         sidebarPanel(
                           selectInput("munic325", "Municipality:",choices = sort(c("All","Avdira",          
                                                                               "Ag Anargiroi- Kamatero"        ,    "Agathonisi"          ,            
                                                                               "Agia"                           ,   "Agia Varvara"         ,           
                                                                               "Agia Paraskevi"                  ,  "Agios Vasillios"     ,            
                                                                               "Agios Dimitrios"                 ,  "Agios Eystratios"    ,            
                                                                               "Agios Nikolaos"                   , "Agistri"              ,           
                                                                               "Agrafa"                           , "Agrinio"              ,           
                                                                               "Athinas"                  ,         "Aigaleo"              ,           
                                                                               "Aigialeia"                 ,        "Aigina"               ,           
                                                                               "Aktio-Vonitsa"              ,       "Aleksandria"          ,           
                                                                               "Aleksandroupoli"                ,   "Aliarthos-Thespies"   ,           
                                                                               "Alimos"                      ,      "Almiros"              ,           
                                                                               "Almopia"                      ,     "Allonisos"            ,           
                                                                               "Amari"                         ,    "Marousi"              ,           
                                                                               "Amorgos"                ,          "Ampelokipoi-Menemeni"  ,          
                                                                               "Amintiao"               ,          "Amfikleia-Elatia"      ,          
                                                                               "Amfiloxia"              ,          "Amfipoli"              ,          
                                                                               "Anatoliki Mani"         ,          "Anafi"                 ,          
                                                                               "Andravida-Kilini"       ,          "Andristena-Krestena"   ,          
                                                                               "Andros"                 ,          "Antiparos"             ,          
                                                                               "Anogeia"                ,          "Apokoronoi"            ,          
                                                                               "Argithea"               ,          "Argos-Mikines"         ,          
                                                                               "Argos-Oresiko"          ,          "Aristotelis"           ,          
                                                                               "Arrianon"               ,          "Arta"                 ,           
                                                                               "Arxea Olympia"          ,          "Axarnes-Asterouses"   ,           
                                                                               "Astipalaia"             ,          "Axarnes "             ,           
                                                                               "Vari-Voula-Vouliagmeni" ,          "Velo Voxas"            ,          
                                                                               "Veroia"                 ,          "Viannou"               ,          
                                                                               "Bisaltia"               ,          "Voiou"                  ,         
                                                                               "Volvi"                  ,          "Volos"                  ,         
                                                                               "North Kinouria"         ,          "North Tzoumerka"        ,         
                                                                               "Vrillisia"              ,          "Vironas"                ,         
                                                                               "Galatsi"                ,          "Gavdos"                  ,        
                                                                               "Georgios Karaiskakis"   ,          "Glifada"                 ,        
                                                                               "Gortina"                ,          "Gortinia"                ,        
                                                                               "Grevena"                ,          "Dafni-Imitos"            ,        
                                                                               "Delta"                  ,          "Delfoi"                  ,        
                                                                               "Deskati"                ,          "Didimotixo"             ,         
                                                                               "Dionisos"               ,          "Dios Olimpios"          ,         
                                                                               "Dirfion-Messapion"      ,          "Distomo-Araxova-Antikira",        
                                                                               "Domokos"                ,          "Doksato"                ,         
                                                                               "Drama"                  ,          "West Ahaia"             ,         
                                                                               "West Mani"              ,          "Dodoni"                  ,        
                                                                               "Dorida"                 ,          "Edessa"                  ,        
                                                                               "Elassona"               ,          "Elafonisos"              ,        
                                                                               "Eleysina"               ,          "Elliniko-Argyroupoli"   ,         
                                                                               "Emmanouil-Pappas"       ,          "Eordeas"                ,         
                                                                               "Epidavros"              ,          "Eretria"                 ,        
                                                                               "Ermionida"              ,          "Erimanthou"              ,        
                                                                               "Evrota"                 ,          "Zagora-Mouresi"          ,        
                                                                               "Zagorio"                ,          "Zakinthos"               ,        
                                                                               "Zaxaro"                 ,          "Zirou"                  ,         
                                                                               "Zitsa"                  ,          "Zografou"               ,         
                                                                               "Igoumenitsa"            ,          "Ilida"                   ,        
                                                                               "Ilioupoli"              ,          "Irakleia"                ,        
                                                                               "Irakleiou Attikis"      ,          "Irakleiou Kritis"        ,        
                                                                               "Thasos"                 ,          "Thermaikos"             ,         
                                                                               "Thermi"                 ,          "Thermou"                 ,        
                                                                               "Thessaloniki"           ,          "Thiva"                   ,        
                                                                               "Thira"                  ,          "Iasmos"                 ,         
                                                                               "Ierapetra"              ,          "Messologi"               ,        
                                                                               "Iiton"                  ,          "Ithaki"                 ,         
                                                                               "Ikaria"                  ,         "Ilion (Nea liosia)"     ,         
                                                                               "Istiaias Aidipsou"       ,         "Ioanniton"               ,        
                                                                               "Kavalla"                 ,         "Kaisariani"             ,         
                                                                               "Kalavrita"              ,          "Kalamaria"               ,        
                                                                               "Kalamata"               ,          "Kalabaka"                ,        
                                                                               "Kalithea"               ,          "Kallimnos"              ,         
                                                                               "Kantanos-Selinos"       ,          "Karditsa"               ,         
                                                                               "Karpathos"              ,          "Karpenisi"              ,         
                                                                               "Karistos"               ,          "Kasos"                   ,        
                                                                               "Kassandra"              ,          "Kastoria"                ,        
                                                                               "Katerini"               ,          "Kato Nevrokopi"         ,         
                                                                               "Kea"                    ,          "Kentrika Tzoumerka"      ,        
                                                                               "Keratsini-Drapetsona"   ,          "Kerkira"                 ,        
                                                                               "Kefallonia"             ,          "Kifisia"                ,         
                                                                               "Kililer"                ,          "Kilkis"                 ,         
                                                                               "Kimolos"                ,          "Kesamos"                 ,        
                                                                               "Kozani"                 ,          "Komotini"                ,        
                                                                               "Konitsa"                ,          "Kordelio-Evosmos"       ,         
                                                                               "Korinthos"              ,          "Koridalos"               ,        
                                                                               "Kropia"                 ,          "Kithira"                 ,        
                                                                               "Kithnos"                ,          "Kimi-Aliveri"            ,        
                                                                               "Kos"                    ,          "Lagkadas"               ,         
                                                                               "Lamia"                  ,          "Larisa"                  ,        
                                                                               "Lavreotiki"             ,          "Livadia"                 ,        
                                                                               "Leros"                  ,          "Lesvos"                  ,        
                                                                               "Leykada"                ,          "Limnos"                 ,         
                                                                               "Limni Plastira"         ,          "Lokroi"                  ,        
                                                                               "Loutraxi-Peraxora-Agioi Theodoroi","Likovrisi-Peyki"         ,        
                                                                               "Makrakomi"              ,          "Maleviziou"             ,         
                                                                               "Mandra-Eidillia"        ,          "Mantoudi-Limni-Agia Anna",        
                                                                               "Marathonas"             ,          "Markopoulo Mesogaias"    ,        
                                                                               "Maroneia-Sapes"         ,          "Megalopoli"             ,         
                                                                               "Meganisi"               ,          "Megarea"                ,         
                                                                               "Megisti"                ,          "Messini"                 ,        
                                                                               "Metamorfosi"            ,          "Metsovo"                 ,        
                                                                               "Milos"                  ,          "Minoas Pediadas"        ,         
                                                                               "Monemvasia"             ,          "Mosxato-Gavros"         ,         
                                                                               "Mouzaki"                ,          "Miki"                    ,        
                                                                               "Mikonos"                ,          "Milopotamos"             ,        
                                                                               "Molos-Agios Konstantinos",         "Naksos and Mikres Kiklades",      
                                                                               "Naousa"                 ,          "Naypaktia"                ,       
                                                                               "Naplio"                 ,          "Neapoli-Sikies"            ,      
                                                                               "Nea Zixni"              ,          "Nea Ionia"                 ,      
                                                                               "Nea Propontida"         ,          "Nea Smirni"                ,      
                                                                               "Nemea"                  ,          "Nestorio"                  ,      
                                                                               "Nestos"                 ,          "Nikaia-Ag. Renti"          ,      
                                                                               "Nikolaou Skoufa"        ,          "Sirou"                     ,      
                                                                               "Notias Kinourias"       ,          "Notiou Piliou"             ,      
                                                                               "Ksanthis"               ,          "Ksriomeros"               ,       
                                                                               "Ksilokastro-Eurostini"  ,          "Oinouses"                 ,       
                                                                               "Oixalia"                ,          "Orestiada"                ,       
                                                                               "Oropedio-Lasithi"       ,          "Orxomenos"                ,       
                                                                               "Pagaio"                 ,          "Paiania"                   ,      
                                                                               "Paiona"                 ,          "Palaio Faliro"             ,      
                                                                               "Palamas"                ,          "Palini"                    ,      
                                                                               "Paksoi"                 ,          "Papagos-Holargos"         ,       
                                                                               "Paranesti"              ,          "Parga"                    ,       
                                                                               "Paros"                  ,          "Patmos"                    ,      
                                                                               "Patra"                  ,          "Pavos Melas"               ,      
                                                                               "Peiraias"               ,          "Pella"                     ,      
                                                                               "Penteli"                ,          "Perama"                   ,       
                                                                               "Peristeri"              ,          "Petroupoli"               ,       
                                                                               "Pinios"                 ,          "Platanias"                 ,      
                                                                               "Poligiros"              ,          "Poros"                     ,      
                                                                               "Preveza"                ,          "Prespes"                   ,      
                                                                               "Prosotsani"             ,          "Pidna Kolindros"           ,      
                                                                               "Pilaia-Hortiatis"       ,          "Pili"                     ,       
                                                                               "Pilou-Nestoros"         ,          "Pirgos"                    ,      
                                                                               "Pogoni"                 ,          "Pafina-Pikermou"           ,      
                                                                               "Rethimno"               ,          "Rigas Fereos"              ,      
                                                                               "Rodos"                  ,          "Salamina"                 ,       
                                                                               "Samothraki"             ,          "Samos"                    ,       
                                                                               "Saronikos"              ,          "Servies-Velventos"         ,      
                                                                               "Serifos"                ,          "Serres"                    ,      
                                                                               "Siteia"                 ,          "Sithonia"                  ,      
                                                                               "Sikinos"                ,          "Sikionion"                ,       
                                                                               "Sintiki"                ,          "Sifnos"                   ,       
                                                                               "Skiathos"               ,          "Skopelos"                  ,      
                                                                               "Skidra"                 ,          "Skiros"                    ,      
                                                                               "Souli"                  ,          "Soufli"                   ,       
                                                                               "Sofades"                ,          "Sparti"                   ,       
                                                                               "Spata-Artemida"         ,          "Spetsa"                   ,       
                                                                               "Stilida"                ,          "Simi"                      ,      
                                                                               "Siros-Ermoupoli"        ,          "Sfakia"                    ,      
                                                                               "Tanagra"                ,          "Tempoi"                   ,       
                                                                               "Tilos"                  ,          "Tinos"                     ,      
                                                                               "Topeirou"               ,          "Trikala"                   ,      
                                                                               "Tripoli"                ,          "Trifilia"                  ,      
                                                                               "Troizina-Methana"         ,        "Tirnavos"                  ,      
                                                                               "Idra"                     ,        "Faistos"                   ,      
                                                                               "Farkadona"               ,         "Farsala"                    ,     
                                                                               "Filadelfia - Xalkidona"  ,         "Filiata"                   ,      
                                                                               "Filothei-Psixiko"        ,         "Florinas"                  ,      
                                                                               "Folegandros"             ,         "Fournoi Korseoi"            ,     
                                                                               "Filis"                   ,         "Haidari"                    ,     
                                                                               "Halandri"                ,         "Halkidona"                 ,      
                                                                               "Halki "                  ,         "Halkiki"                    ,     
                                                                               "Hania"                   ,         "Hersonisos"                 ,     
                                                                               "Hios"                   ,          "Psara"                    ,       
                                                                               "Oreokastro"             ,          "Oropos", "Leipsoi")), selected = "All"
                           ),
                           width = 3),
                         mainPanel(
                           plotOutput('projects325'),
                           DT::dataTableOutput('projects325b')  
                         )
                       )
              )
  )
)