##### R Task


## Pick your favorite celebrity who has a Twitter account. 

# Joel Embiid

## find the most recent tweet the celebrited liked

embiid <- get_favorites("JoelEmbiid", n = 1)

##Download their 500 most recent tweets. 

embiid_tweets <- get_timelines(c("JoelEmbiid"), n = 500)

#Calculate which one got the most ``likes"

embiid_likes <- select(embiid_tweets, favorite_count)
embiid_likes2 <- unlist(embiid_likes)
which.max(embiid_likes2)
# Tweet 113 was the most liked post
# It was his RIP to Kobe post

f### Create a DFM from the text of these tweets
library(dplyr)
embiid_tweets2 <- select(embiid_tweets, text)
View(embiid_tweets2)
embiid_corpus <- corpus(embiid_tweets2)
embiid_dfm <- dfm(embiid_corpus, remove = stopwords("en"), remove_punct = T)

### After removing stopwords, what word did the celebrity tweet most often?

topfeatures(dfm(embiid_tweets$text, remove = stopwords("en"), remove_punct = T))

# The most tweeted was "#theprocess" his nickname and favorite slogan
