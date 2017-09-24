rm(list = ls())
install.packages('igraph')
library(igraph)
#plot(graph_from_literal(a--+b, b+--c)) #-+left to right; +-: right to left
plot(graph_from_literal(a:b:c---c:d:e))