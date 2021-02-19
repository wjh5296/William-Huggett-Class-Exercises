# Descriptive practice
install.packages("quanteda")

#1. Write two sentences. Save each as a seperate object in R. 

require(quanteda)
line1 = "The lazy fox jumped over the cliff and died"
line2 = "Mary had a little lamb chops for dinner"
txt <- c(line1 , line2)

#2. Combine them into a corpus

corpus_txt <- corpus(txt)

#3. Make this corpus into a dfm with all pre-processing options at their defaults.

dfm_txt <- dfm(corpus_txt)

#4. Now save a second dfm, this time with stopwords removed.

dfm_txt2 <- dfm(corpus_txt, remove = stopwords("english"))


#5. Calculate the TTR for each of these dfms (use textstat_lexdiv). Which is higher?

textstat_lexdiv(dfm_txt)
textstat_lexdiv(dfm_txt2)

# The TTR is higher for the second dfm

#6. Calculate the Manhattan distance between the two sentences you've constructed (by hand!)

# NA