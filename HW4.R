

if (!require('Rfacebook')){
    install.packages("Rfacebook")
    library(Rfacebook)
}
token<-'CAACEdEose0cBAAQZBgmuZBTZCcAvNmgydx0puEPlg8fNWkbtXfWcZA511PjOBsThFILwysBqoIZAZC00UfbNIvqJikzcUfNRkyoZBXiBSaNiikg23txunMdVVTRLQbZBzFvTaBXpivR4RM28zwgFnq0FWPOKtbGBusiaY6ZAQTZCgBlYIx6f4yKN4VSXLUrwiiRQsSyjsdx42TTgZDZD'
totalPage<-NULL
lastDate<-Sys.Date()
DateVectorStr<-as.character(seq(as.Date("2016-01-01"),lastDate,by="7 days"))
for(i in 1:(length(DateVectorStr)-1)){
    tempPage<-getPage("DoctorKoWJ", token,
                      since = DateVectorStr[i],until = DateVectorStr[i+1])
    totalPage<-rbind(totalPage,tempPage)
}
nrow(totalPage)

#每日發文數分析
totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", 
                                 tz = "GMT") #2016-01-16T15:05:36+0000
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", 
                            tz = "Asia/Taipei") #2016-01-16
totalPage$weekdays <-weekdays(as.Date(totalPage$dateTPE))
PostCount<-aggregate(id~dateTPE,totalPage,length)
library(knitr)
kable(head(PostCount[order(PostCount$id,decreasing = T),]))

LikeCount<-aggregate(likes_count~dateTPE,totalPage,mean)
library(knitr)
kable(head(LikeCount[order(LikeCount$likes_count,decreasing = T),]))


totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", 
                                 tz = "GMT") #2016-01-16T15:05:36+0000
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", 
                            tz = "Asia/Taipei") #2016-01-16
totalPage$weekdays <-weekdays(as.Date(totalPage$dateTPE))
PostCount<-aggregate(id~dateTPE,totalPage,length)
library(knitr)
kable(head(PostCount[order(PostCount$id,decreasing = T),]))

LikeCount<-aggregate(likes_count~dateTPE,totalPage,mean)
library(knitr)
kable(head(LikeCount[order(LikeCount$likes_count,decreasing = T),]))


totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", 
                                 tz = "GMT") #2016-01-16T15:05:36+0000
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", 
                            tz = "Asia/Taipei") #2016-01-16
totalPage$weekdays <-weekdays(as.Date(totalPage$dateTPE))
PostCount<-aggregate(id~dateTPE,totalPage,length)
library(knitr)
kable(head(PostCount[order(PostCount$id,decreasing = T),]))

CommentsCount<-aggregate(comments_count~dateTPE,totalPage,mean)
library(knitr)
kable(head(CommentsCount[order(CommenysCount$comments_count,decreasing = T),]))



totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", 
                                 tz = "GMT") #2016-01-16T15:05:36+0000
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", 
                            tz = "Asia/Taipei") #2016-01-16
totalPage$weekdays <-weekdays(as.Date(totalPage$dateTPE))
PostCount<-aggregate(id~dateTPE,totalPage,length)
library(knitr)
kable(head(PostCount[order(PostCount$id,decreasing = T),]))

SharesCount<-aggregate(shares_count~dateTPE,totalPage,mean)
library(knitr)
kable(head(SharesCount[order(SharesCount$shares_count,decreasing = T),]))

