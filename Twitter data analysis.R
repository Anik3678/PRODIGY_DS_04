#Prodigy Infotech DS Task-4


#Analyse and visualise sentiment patterns in social media data to understand public opinion & attitude towards specific topics or brands

#Load the data
twitter<-read.csv("C:\\Users\\User\\Documents\\Data science\\Internship\\Prodigy Infotech Internship\\Task-4\\twitter_training.csv")

#View the data
View(twitter)

#Checking for missing value
any(is.na(twitter))

#Observing no. of rows & columns of the dataset
dim(twitter)

#Change the colnames of the dataset
colnames(twitter)<-c("ID","Entity","Sentiments","Contest")

#Summary of the dataset
summary(twitter)

#Checking for duplicated values
any(duplicated(twitter))

#Remove duplicate value
twitters<-unique(twitter)

#Again checking for duplicated values
any(duplicated(twitters))

#Column names of the dataset
colnames(twitters)

#Load library
library(dplyr)
library(ggplot2)

#Count occurrences and create a data frame
sentiment_counts <- twitters %>% 
  count(Sentiments)

#Viewing the count dataset
sentiment_counts

#Plot Sentiment distribution
ggplot(data = twitters, aes(x = Sentiments)) +
  geom_bar(fill=c("darkblue","lightgreen","brown","orange")) +
  labs(title = "Sentiment distribution",
       x = "Number of tweets",
       y = "Count")

#Filter for rows where 'Entity' contains 'Microsoft' (case-insensitive)
brand_data <- twitters %>%
  filter(grepl("Microsoft", Entity, ignore.case = TRUE))

#Count occurrences and create a data frame
brand_sentiment_counts <- brand_data %>%
  count(Sentiments)

#Viewing the count dataset
brand_sentiment_counts

#Plot the piechart of Brand Sentiment Distribution
par(mar = c(1, 1, 1, 1), pin = c(3, 2.5))  # Adjust pin to make the plot larger
pie(
  brand_sentiment_counts$n, 
  main = "Brand Sentiment Distribution",
  labels=paste(brand_sentiment_counts$Sentiments, round((brand_sentiment_counts$n/sum(brand_sentiment_counts$n)) * 100,1), "%"),
  col=rainbow(length(brand_sentiment_counts$n))
)
