rm(list = ls())
#install.packages("twitteR")
library(twitteR)
#install.packages("ROAuth")
library(ROAuth)
#install.packages('scheduleR')

#library(SchedulerR) 
requestURL <-   'https://api.twitter.com/oauth/request_token'
accessURL =    'https://api.twitter.com/oauth/access_token'
authURL =      'https://api.twitter.com/oauth/authorize'
consumerKey =   'a3AUdm2jNTEpQrLXUXqN3bsCY'
consumerSecret = 'yMWyNGq9jxZ81A9CJHNxSfrEtYqi7FlWZOqQSdMwTDbxfLEK2T'
access_token='766666721411334144-B1wenuJoJ7u9vHF83NdlZhOeubjfwUE'
access_secret='rSunhD7gkP77JlsZwuHa0hE1LBoC1RatHnHU4UIWF7WG2'
twitCred <- OAuthFactory$new(consumerKey=consumerKey,
                             consumerSecret=consumerSecret,
                            requestURL=requestURL,
                             accessURL=accessURL,
                             authURL=authURL)
download.file(url='http://curl.haxx.se/ca/cacert.pem',
              destfile='cacert.pem')
twitCred$handshake(cainfo='cacert.pem')
1337723
save(list='twitCred', file='twitteR_credentials')
load('twitteR_credentials')
setup_twitter_oauth(consumerKey,consumerSecret,access_token,access_secret)
#registerTwitterOAuth(twitCred)#Register your app with Twitter.
Yes
Teemo<-searchTwitter('Teemo',n=2000,lang = 'en',resultType = 'recent')
#LOL <- userTimeline("League", n = 3200)
Teemo_df<-twListToDF(Teemo)
View(Teemo_df)
LOL_df$text
write.csv(LOL_df,file = 'LOL.csv')
