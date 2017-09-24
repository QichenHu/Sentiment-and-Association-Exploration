rm(list=ls())
#install.packages('graph')
install.packages('Rgraphviz')
#library(igraph)
library(Rgraphviz)
source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")
#install.packages('topicmodels')
library(topicmodels)
library(data.table)
#---------------------------------------------------------------------------------------------------------------------------------
#
#--------------------------------------------------------3: Association-----------------------------------------------------
#
#---------------------------------------------------------------------------------------------------------------------------------
#3.1: Test Association

l1=findAssocs(tdm,'legends',0.1)
l2=findAssocs(tdm,'lol',0.2)
l3=findAssocs(tdm,'riot',0.2)
freq.terms<-findFreqTerms(tdm, lowfreq=20)[1:50]

plot(tdm, term = freq.terms, corThreshold = 0.1, weighting = T,
attrs = list(graph = list(rankdir ="BT"),node = list(shape = "rectangle",fixedsize=FALSE,fontsize=40)))

#3.2: Topic Modeling:
dtm <- as.DocumentTermMatrix(tdm)

lda <- LDA(dtm, k = 8) # find 8 topics
term <- terms(lda, 15) # first 7 terms of every topic 
(term <- apply(term, MARGIN = 2, paste, collapse = ", "))

topics <- topics(lda) # 1st topic identified for every document (tweet) 
topics <- data.frame(date=as.IDate(lol$created), topic=topics) 
ggplot(topics, aes(date, fill = term[topic])) +
geom_density(position = "stack")

topics <- data.frame(date=minute(lol$created), topic=topics) 
ggplot(topics, aes(date, fill = term[topic])) +
geom_density(position = "stack")
#---------------------------------------------------------------------------------------------------------------------------------
#
#--------------------------------------------------------4: Sentiment Analysis-----------------------------------------------------
#
#---------------------------------------------------------------------------------------------------------------------------------
#4.1:
require(devtools)
install_github("sentiment140", "okugami79")
library(devtools)
library(sentiment)
sentiments <- sentiment(lol$text)
table(sentiments$polarity)
View(sentiments)
#4.2:
sentiments$score <- 0
sentiments$score[sentiments$polarity == "positive"] <- 1
sentiments$score[sentiments$polarity == "negative"] <- -1
sentiments$date <- minute(lol$created)
result <- aggregate(score ~ date, data = sentiments, sum)
plot(result, type = "l",xlab='Time',col='red')
polygon(result,col='green',angle = 0)
polygon(density(rnorm(100)))











