library(lubridate)
library(sqldf)
#library(data.table)
# bday<-ymd("19591119")
# bday<-ymd("19630510")
# bday<-ymd("19630812")
# bday<-ymd("20000919")
# x<-1:50
# interval<-days(1000)
# mDays<-as.data.frame(bday+x*interval)
# 
# 

shinyServer(function(input, output) {
  today<-as.character((strptime(now(), format = "", tz = ""))
  output$today<-renderText(as.character(today))))
  
  output$mDays<- renderTable({
    bday<-(input$date)
    x<-1:50
    interval<-days(1000)
    mDates<-(bday+x*interval)
    #str(mDates)
    mDates<-as.character(mDates)
    mDates<-as.data.frame(mDates)
    mDates$idx<-1:nrow(mDates)
    join_string <- paste("select *, mDates.mDates from mDates where mDates > ", today, "order by idx ASC limit 10", sep = " ")
                
    output$nextMday<-sqldf(join_string,stringsAsFactors = FALSE)
    return(mDates)
  })

})