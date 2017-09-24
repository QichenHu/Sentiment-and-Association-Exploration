#install.packages('SnowballC')
rm(list=ls())
lol <- read.csv("~/Desktop/Riot Application/Data/LOL.csv")
library(tm)
library(SnowballC)
# build a corpus, and specify the source to be character vectors myCorpus <- Corpus(VectorSource(tweets.df$text))
# convert to lower case

#
#--------------------------------------------------------1: Convert Test Format-----------------------------------------------------
#

myCorpus <- Corpus(VectorSource(lol$text))
myCorpus <- tm_map(myCorpus, content_transformer(tolower),lazy = TRUE)
# remove URLs
removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
myCorpus <- tm_map(myCorpus, content_transformer(removeURL),lazy = TRUE)
# remove anything other than English letters or space 
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x) 
myCorpus <- tm_map(myCorpus, content_transformer(removeNumPunct),lazy = TRUE)
# remove stopwords
myStopwords <- c(stopwords('english'), "league", "of", "legends", "game", "champion", "gamers", "play")
myCorpus <- tm_map(myCorpus, removeWords, myStopwords,lazy = TRUE)
myCorpus <- tm_map(myCorpus, stripWhitespace,lazy = TRUE)
myCorpusCopy <- myCorpus

myCorpus <- tm_map(myCorpus, stemDocument,lazy = TRUE) # stem words
## r refer card data mine now provid link packag cran packag
## mapreduc hadoop ad
  'stemCompletion2 <- function(x, dictionary) {
  x=unlist(strsplit(as.character(x),''))
  x=x[x!='']
  x=stemCompletion(x,dictionary=dictionary)
  x=paste(x,sep='',collapse = '')
  PlainTextDocument(stripWhitespace(x))
  }
  myCorpus <- lapply(myCorpus, stemCompletion2, dictionary=myCorpusCopy)
  myCorpus<-stemCompletion2(myCorpus,dictionary = myCorpusCopy)'
myCorpus=unlist(strsplit(as.character(myCorpus),''))
myCorpus=myCorpus[myCorpus!='']
myCorpus=paste(myCorpus,sep='',collapse = '')
PlainTextDocument(stripWhitespace(myCorpus))

myCorpus <- Corpus(VectorSource(myCorpus))
writeLines(strwrap(myCorpus[[190]]$content, 60))










