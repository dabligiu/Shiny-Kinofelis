library(scales)
library(shiny)
library(DT)
library(ggplot2)
#library(googlesheets)
#require(plyr)
#library(dplyr)
library(stringr)

# sheet2<-gs_key("139ynC2bWIvvfBnZy795Upyiy85dh3jqEbNg6ccCts9E")
# sheet3<-gs_key("1ZdzVetaR2um8HzJc5IajpiDzFbAA9QzNpTKB9RZIpXw")
# sheet<-gs_key("1f_9thEqNwSs6nkJEAnVOIil3Xv6ErSB3nMn4iLN1pds")
# sheet4<-gs_key("1n1-sVARzsi6lFYeyShpIOuYj78lu3HI5qJ030asShJg")
# sheet5<-gs_key("19t_AfE3e5lc_mTj8a3eSALybjeguQgzzP3jCJgpfWDA")
# sheet6<-gs_key("1syrKJtby5u5Gsn4nszZGz-7VbUJ6dZdXyfiz4EcWrd4")
# sheet7<-gs_key("1HWg8pVFC7kNtMQXYYgJt53erp46CpZ09boqvAA3VQ8A")
# sheet8<-gs_key("1McWPPBf1XTWY6NrvXUf6RWgEtE2JunaVbLM8hwT03WM")
# sheet9<-gs_key("1PP18sToGiiYC3D9L4QWGGQl7x9wN2XgVxTksIh2ccA8")
# sheet10<-gs_key("13rnpd9qj_FJuBx_ZZCMQMcA07Q0JXR1hbZaIKxQy0DU")
# sheet11<-gs_key("1fs08dtD4lFh3FT-7jzjz884-upLTiKJCHeWJPlySJiQ")
# sheet12<-gs_key("1Mjggah8o5rsCQGI0Bzu1a_M6z-o7mVReoDJdXT9SXMQ")
# sheet13<-gs_key("1QeF1iQPkiq7Hru1OUFl0pNZDPjYuwMzM1XixAURyx1E")
# sheet14<-gs_key("1YyiXNHCJ0aIrcltPSl6LZBdtHyCgrLlkj_PlfLm13vo")
# 
# fulldata<-as.data.frame(gs_read_csv(sheet))
# fulldata2<-as.data.frame(gs_read_csv(sheet2))
# fulldata3<-as.data.frame(gs_read_csv(sheet3))
# fulldata4<-as.data.frame(gs_read_csv(sheet4))
# fulldata5<-as.data.frame(gs_read_csv(sheet5))
# fulldata6<-as.data.frame(gs_read_csv(sheet6))
# fulldata7<-as.data.frame(gs_read_csv(sheet7))
# fulldata8<-as.data.frame(gs_read_csv(sheet8))
# fulldata9<-as.data.frame(gs_read_csv(sheet9))
# fulldata10<-as.data.frame(gs_read_csv(sheet10))
# fulldata15<-as.data.frame(gs_read_csv(sheet11))
# fulldata16<-as.data.frame(gs_read_csv(sheet12))
# fulldata17<-as.data.frame(gs_read_csv(sheet13))
# fulldata18<-as.data.frame(gs_read_csv(sheet14))

setwd("C:/Users/dab/Dropbox/ILO/shiny")
fulldata<-read.csv("17 gender succesful ana Dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata2<-read.csv("17 kea successful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata3<-read.csv("17 kea ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata4<-read.csv("17 gender ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata5<-read.csv("17 age sucessful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata6<-read.csv("17 age ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata7<-read.csv("17 edlvl ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata8<-read.csv("17 edlvl successful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata9<-read.csv("17 unemp ana age ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata10<-read.csv("17 unemp ana age ana dimo succ.csv",header=TRUE,fill=TRUE,sep=",")
fulldata15<-read.csv("17 edund ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata16<-read.csv("17 edund successful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata17<-read.csv("34 kea successful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
fulldata18<-read.csv("34 kea ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
setwd("C:/Users/dab/Dropbox/ILO/data/erga")
fulldata19<-read.csv("325 erga.csv",header=TRUE,fill=TRUE,sep=",")

# setwd("/srv/shiny-server/Kinofelis/data")
# fulldata<-read.csv("17 gender succesful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata2<-read.csv("17 kea successful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata3<-read.csv("17 kea ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata4<-read.csv("17 gender ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata5<-read.csv("17 age sucessful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata6<-read.csv("17 age ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata7<-read.csv("17 edlvl ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata8<-read.csv("17 edlvl successful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata9<-read.csv("17 unemp ana age ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata10<-read.csv("17 unemp ana age ana dimo succ.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata15<-read.csv("17 edund ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata16<-read.csv("17 edund successful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata17<-read.csv("34 kea successful ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata18<-read.csv("34 kea ana dimo.csv",header=TRUE,fill=TRUE,sep=",")
# fulldata19<-read.csv("325 erga.csv",header=TRUE,fill=TRUE,sep=",")

fulldata12<-fulldata[,1:4]
fulldata22<-fulldata2[,1:4]
fulldata32<-fulldata3[,1:4]
fulldata42<-fulldata4[,1:4]
fulldata172<-fulldata17[,1:4]
fulldata182<-fulldata18[,1:4]
fulldata19$Municipality<-as.character(fulldata19$Municipality)
fulldata19$Category = str_wrap(fulldata19$Category, width = 10)
server<-function(input, output, session) {
  
  #325
  proj325<-reactive({
       er<-fulldata19[fulldata19$Municipality == input$munic325,]
     })

  proj325b<-reactive({
    er2<-fulldata19[fulldata19$Municipality == input$munic325,]
  })

  projheight<-reactive({
    if (input$munic325 == "All"){
      a<-1700

  }
  else {
    eur<-fulldata19[fulldata19$Municipality == input$munic325,]
    eur2<-eur$Freq
    eur3<-as.numeric(max(eur2)+20*max(eur2)/100)
  }
  })
  #17
  gender1 <- reactive({
    if (input$datatype2 == "a" ){
      if (input$munic == "All"){
        return(fulldata42)
      }
      else {
        dimoisel<-fulldata42[fulldata42$Municipality == input$munic,]
      }
    }
    else
    {
      if (input$munic == "All"){
        return(fulldata12)
      }
      else {
        dimoisel<-fulldata12[fulldata12$Municipality == input$munic,]
      }
    }
  })
  
  gender2 <- reactive({
    if (input$datatype2 == "a" ){
      if (input$munic == "All"){
        return(fulldata4)
      }
      else {
        dimoisel<-fulldata4[fulldata4$Municipality == input$munic,]
      }
    }
    else {
      if (input$munic == "All"){
        return(fulldata)
      }
      else {
        dimoisel<-fulldata[fulldata$Municipality == input$munic,]
      }
    }
  })
  gender3<-reactive({
    if (input$munic == "All"){
      s<-300
      list(height = s)
    }
    else {
      s<-70
      list(height = s)
    }
  })
  kolp2<-reactive({
    gender3()$height
  })
  gmi1 <- reactive({
    if (input$datatype3 == "a" ){
      if (input$munic2 == "All"){
        return(fulldata32)
      }
      else {
        dimoisel<-fulldata32[fulldata32$Municipality == input$munic2,]
      }
    }
    else{
      if (input$munic2 == "All"){
        return(fulldata22)
      }
      else {
        dimoisel<-fulldata22[fulldata22$Municipality == input$munic2,]
      }
    }
  })
  
  gmi2 <- reactive({
    if (input$datatype3 == "a" ){
      if (input$munic2 == "All"){
        return(fulldata3)
      }
      else {
        dimoisel<-fulldata3[fulldata3$Municipality == input$munic2,]
      }
    }
    else {
      if (input$munic2 == "All"){
        return(fulldata2)
      }
      else {
        dimoisel<-fulldata2[fulldata2$Municipality == input$munic2,]
      }
    }
  })
  ssi173<-reactive({
    if (input$munic2 == "All"){
      s<-300
      list(height = s)
    }
    else {
      s<-70
      list(height = s)
    }
  })
   kolp3<-reactive({
    ssi173()$height
  })

  age<- reactive({
    if (input$datatype == "b" ){
      s<-fulldata5[fulldata5$Municipality == input$munic3,]
      u<-s[,3 ] 
    }
    else{
      s<-fulldata6[fulldata6$Municipality == input$munic3,]
      u<-s[,3 ] 
    }
  })
  age2<-reactive({
    if (input$datatype == "b" ){
      return(fulldata5[fulldata5$Municipality == input$munic3,])
    }
    else{
      return(fulldata6[fulldata6$Municipality == input$munic3,])
    }
  })
  edlvl<-reactive({
   fulldata7<-fulldata7[fulldata7$Municipality == input$munic4,]
   d<-fulldata7[,c("Category","Freq")]
  })
  edlvl2<-reactive({
    fulldata8<-fulldata8[fulldata8$Municipality == input$munic4,]
    d<-fulldata8[,c("Category","Freq")]
  })
  
  unemp<-reactive({ 
    if (input$datatype4 == "a" ){
      fulldata9<-fulldata9[fulldata9$Municipality == input$munic5,]
      fulldata9<-fulldata9[fulldata9$Age == input$age, ]
      u<-fulldata9[,2]
  }
    else{
      fulldata10<-fulldata10[fulldata10$Municipality == input$munic5,]
      fulldata10<-fulldata10[fulldata10$Age == input$age, ]
      u<-fulldata10[,2]
    }
  })
  unemp2<-reactive({
    if (input$datatype4 == "a" ){
    fulldata9<-fulldata9[fulldata9$Municipality == input$munic5,]
    fulldata9<-fulldata9[fulldata9$Age == input$age, ]
    }
    else {
    fulldata10<-fulldata10[fulldata10$Municipality == input$munic5,]
    fulldata10<-fulldata10[fulldata10$Age == input$age, ]  
    }
  })
  edund<-reactive({
    fulldata15<-fulldata15[fulldata15$Municipality == input$munic6,]
    d<-fulldata15[,c("Category","Freq")]
  })
  edund2<-reactive({
    fulldata16<-fulldata16[fulldata16$Municipality == input$munic6,]
    d<-fulldata16[,c("Category","Freq")]
  })
  #34
   ssi<-reactive({
     if (input$datatype34a == "b"){
       l<-fulldata17
       if (input$munic34a == "All"){
       return(l)
       }
       else {
       l<-l[l$municipality == input$munic34a,]
       return(l)
       }
     }
     else {
       l<-fulldata18
       if (input$munic34a == "All"){
         return(l)
       }
       else {
         l<-l[l$municipality == input$munic34a,]
         return(l)
       }
     }
     })
   ssi2<-reactive({
     if (input$datatype34a == "a"){
      l<-fulldata182
        if (input$munic34a == "All"){
        return(l)
        }
        else {
        l<-l[l$municipality == input$munic34a,]
         return(l)
        }
     }
     else {
       l<-fulldata172
       if (input$munic34a == "All"){
         return(l)
       }
       else {
         l<-l[l$municipality == input$munic34a,]
         return(l)
       }
     }
    })
   
   ssi3<-reactive({
     if (input$munic34a == "All"){
       s<-580
       list(height = s)
     }
     else {
       s<-70
       list(height = s)
     }
   })
   kolp<-reactive({
     ssi3()$height
   })
   
   
   
   
     #datatable for gender
  output$gendertable <- DT::renderDataTable(
    gender1(),extensions ="Buttons",options = list(
      columnDefs = list(list(className = "dt-center", targets = 0:3)),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')),
    rownames= FALSE)
  #barchart for gender
  output$gendertable2 <- renderPlot(
    ggplot(gender2(),aes(x = Municipality, y = Freq ,fill = Target )) + 
      geom_bar(position = "fill",stat = "identity") + 
      scale_y_continuous(labels = percent_format()) +
      geom_text(aes(label=ifelse(Percentage3 >= 7, paste0(sprintf("%.0f", Percentage3),"%"),""),
                    y=pos), colour="white") +
      coord_flip() +
      labs(y="", x="")+
      theme(legend.title = element_blank(),
            panel.background = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.grid.major = element_blank()),
    height = kolp2
  )
  #datatable for GMI
  output$gmitable <- DT::renderDataTable(
    gmi1(),extensions ="Buttons",options = list(
      columnDefs = list(list(className = "dt-center", targets = 0:3)),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')),
    rownames= FALSE)
  #barchart for GMI
  output$gmitable2 <- renderPlot(
    ggplot(gmi2(),aes(x = Municipality, y = Freq ,fill = Target )) + 
      geom_bar(position = "fill",stat = "identity") + 
      scale_y_continuous(labels = percent_format()) +
      geom_text(aes(label=ifelse(Percentage3 >= 7, paste0(sprintf("%.0f", Percentage3),"%"),""),
                    y=pos), colour="white") +
      coord_flip() +
      labs(y="", x="")+
      theme(legend.title = element_blank(),
            panel.background = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.grid.major = element_blank()),
    height = kolp3
  )
  #barplot for age  
  output$agetable<-renderPlot(
    barplot(age(), names.arg = c("16-25","25-30","30-35","35-40",
                                 "40-45","45-50","50-55","55-60",
                                 "60-65","65-71"), xlab = "Age Brackets", ylab = "Number of Individuals", ylim = c(0,max(age()+ 20*max(age()/100)))) %>%
      text(y=age(),labels = age(),pos = 3) 
    
  )
  output$agetable2<-DT::renderDataTable(
    age2(),extensions ="Buttons", options = list(
      columnDefs = list(list(className = "dt-center", targets = "_all")),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')),
    rownames= FALSE)
  #pies for education level
  output$edlvl<-renderPlot(
    ggplot(transform(transform(edlvl(), Freq=Freq/sum(Freq)), labPos=cumsum(Freq)-Freq/2), 
      aes(x="", y = Freq, fill = Category)) +
      geom_bar(width = 1, stat = "identity") +
      scale_fill_manual(values = c("cadetblue2", "chartreuse2","chocolate2", "darkgoldenrod1")) +
      coord_polar(theta = "y") +
      labs(title = "All Applicants") +
      theme(axis.title.x=element_blank(),
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank(),
            axis.title.y=element_blank(),
            axis.text.y=element_blank(),
            axis.ticks.y=element_blank(),
            panel.background = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.grid.major = element_blank(),
            plot.background = element_rect(fill = "transparent", colour = NA)
      )+
      geom_text(aes(y=labPos, label=scales::percent(Freq)))
  )
  output$edlvl2<-renderPlot(
    ggplot(transform(transform(edlvl2(), Freq=Freq/sum(Freq)), labPos=cumsum(Freq)-Freq/2), 
      aes(x="", y = Freq, fill = Category)) +
      geom_bar(width = 1, stat = "identity") +
      scale_fill_manual(values = c("cadetblue2", "chartreuse2","chocolate2", "darkgoldenrod1")) +
      coord_polar(theta = "y") +
      labs(title = "Successful Beneficiaries") + 
      theme(axis.title.x=element_blank(),
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank(),
            axis.title.y=element_blank(),
            axis.text.y=element_blank(),
            axis.ticks.y=element_blank(),
            panel.background = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.grid.major = element_blank(),
            plot.background = element_rect(fill = "transparent", colour = NA)
      )+
      geom_text(aes(y=labPos, label=scales::percent(Freq)))
  )
  output$edlvl3<-DT::renderDataTable(
    edlvl(),extensions ="Buttons", options = list(
      columnDefs = list(list(className = "dt-center", targets = "_all")),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')),
    rownames= FALSE)
  output$edlvl4<-DT::renderDataTable(
    edlvl2(),extensions ="Buttons", options = list(
      columnDefs = list(list(className = "dt-center", targets = "_all")),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')),
    rownames= FALSE)
  #plot for age/unemployment profile
  output$uneage<-renderPlot(
    barplot(unemp(), names.arg = c("0","1","2","3","4","5"),
               xlab = "Consecutive Years Unemployed",
               ylab = "Number of Individuals",
               ylim = c(0,max(unemp())+ 20*max(unemp()/100))) %>%
      text(y=unemp(),labels = unemp(),pos = 3)
  )
  output$unemp2 <- DT::renderDataTable(
    unemp2(),extensions ="Buttons",options = list(
      columnDefs = list(list(className = "dt-center", targets = 0:3)),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')),
    rownames= FALSE)
  #plots for education under/over registration
  output$edund<-renderPlot(
    ggplot(transform(transform(edund(), Freq=Freq/sum(Freq)), labPos=cumsum(Freq)-Freq/2), 
           aes(x="", y = Freq, fill = Category)) +
      geom_bar(width = 1, stat = "identity") +
      scale_fill_manual(values = c("cadetblue2", "chartreuse2","chocolate2", "darkgoldenrod1")) +
      coord_polar(theta = "y") +
      labs(title = "All Applicants") +
      theme(axis.title.x=element_blank(),
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank(),
            axis.title.y=element_blank(),
            axis.text.y=element_blank(),
            axis.ticks.y=element_blank(),
            panel.background = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.grid.major = element_blank(),
            plot.background = element_rect(fill = "transparent", colour = NA)
      )+
      geom_text(aes(y=labPos, label=scales::percent(Freq)))
  )
  output$edund2<-renderPlot(
    ggplot(transform(transform(edund2(), Freq=Freq/sum(Freq)), labPos=cumsum(Freq)-Freq/2), 
           aes(x="", y = Freq, fill = Category)) +
      geom_bar(width = 1, stat = "identity") +
      scale_fill_manual(values = c("cadetblue2", "chartreuse2","chocolate2", "darkgoldenrod1")) +
      coord_polar(theta = "y") +
      labs(title = "Successful Beneficiaries") + 
      theme(axis.title.x=element_blank(),
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank(),
            axis.title.y=element_blank(),
            axis.text.y=element_blank(),
            axis.ticks.y=element_blank(),
            panel.background = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.grid.major = element_blank(),
            plot.background = element_rect(fill = "transparent", colour = NA)
      )+
      geom_text(aes(y=labPos, label=scales::percent(Freq)))
  )
  output$edund3<-DT::renderDataTable(
    edund(),extensions ="Buttons", options = list(
      columnDefs = list(list(className = "dt-center", targets = "_all")),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')),
    rownames= FALSE)
  output$edund4<-DT::renderDataTable(
    edund2(),extensions ="Buttons", options = list(
      columnDefs = list(list(className = "dt-center", targets = "_all")),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')),
    rownames= FALSE)
  #34
  output$SSI34 <- renderPlot(
    ggplot(ssi(),aes(x = municipality, y = Freq ,fill = SSI )) + 
      geom_bar(position = "fill",stat = "identity") + 
      scale_y_continuous(labels = percent_format()) +
      geom_text(aes(label=ifelse(Percentage3 >= 7, paste0(sprintf("%.0f", Percentage3),"%"),""),
                    y=pos), colour="white") +
      coord_flip() +
      labs(y="", x="")+
      theme(legend.title = element_blank(),
            panel.background = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.grid.major = element_blank()), 
     height = kolp
  ) 
  output$SSI34b <- DT::renderDataTable(
    ssi2(),extensions ="Buttons",options = list(
      columnDefs = list(list(className = "dt-center", targets = 0:3)),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')),
    rownames= FALSE)
  
  #325
  output$projects325<-renderPlot(
    ggplot(proj325(), aes(x=Category, y= Freq, fillCol("red"))) + 
    geom_text(aes(label=Freq), vjust=-0.4)+
    geom_bar( stat = "identity",fill = "grey", colour = "Black")+
    theme(axis.text.x = element_text(angle = 90, hjust = 1))+
      labs(y="Number of Projects", x="Category")+
      theme(legend.title = element_blank(),
            axis.text=element_text(size = 16),
            panel.background = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.grid.major = element_blank())+
      ylim(0,projheight())
    
  )
  
  output$projects325b<-DT::renderDataTable(
    proj325b(),extensions ="Buttons", options = list(
      columnDefs = list(list(className = "dt-center", targets = "_all")),
      pageLength = 34,
      paging = FALSE,
      scrollY = 400,
      dom = 'Bt',
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
    rownames= FALSE))

}



