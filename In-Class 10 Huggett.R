install.packages('jsonlite')
library(jsonlite)
library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)


##code adapted from Heather Geiger




NYTIMES_KEY <- ("DbaSFrzQ1inElRji9GwOMSTup5bAZCFT")

term <- "facebook"
begin_date <- "20200101"
end_date <- "20200401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2020 <- vector("list",length=5)

for(i in 0:4){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame() 
  pages_2020[[i+1]] <- nytSearch 
  Sys.sleep(10) #I was getting errors more often when I waited only 1 second between calls. 5 seconds seems to work better.
}
facebook_2020_articles <- rbind_pages(pages_2020)



term <- "sixers"
begin_date <- "20210101"
end_date <- "20210401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2021 <- vector("list",length=4)

for(i in 0:4){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame()
  pages_2021[[i+1]] <- nytSearch
  Sys.sleep(10)
}
sixers_2021_articles <- rbind_pages(pages_2021)





#####in-class practice: 


### save the results of two different queries from the date range jan 1 2021 - APril 1 2021
term <- "sixers"
begin_date <- "20210101"
end_date <- "20210401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2021 <- vector("list",length=4)

for(i in 0:4){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame()
  pages_2021[[i+1]] <- nytSearch
  Sys.sleep(10)
}
sixers_2021_articles <- rbind_pages(pages_2021)

# Second Query

term <- "iran"
begin_date <- "20210101"
end_date <- "20210401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2021 <- vector("list",length=4)

for(i in 0:4){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame()
  pages_2021[[i+1]] <- nytSearch
  Sys.sleep(10)
}
iran_2021_articles <- rbind_pages(pages_2021)


### calculate the proportion of the headlines from each search term assigned to a given section name
table(sixers_2021_articles$response.docs.section_name)
table(iran_2021_articles$response.docs.section_name)
## create a combined dfm with the text of all of the lead paragraphs
lead_para <- sixers_2021_articles$response.docs.lead_paragraph
lead_para2 <- iran_2021_articles$response.docs.lead_paragraph
lead_paras <- c(lead_para,lead_para2)
nyt_dfm <- dfm(lead_paras)
View(nyt_dfm)
## calculate the average Flesch Reading Ease score (hint: use code form descriptive_2.R) for the lead paragraphs from each search term. Which is higher?
fl_read2 <- textstat_readability(iran_2021_articles$response.docs.lead_paragraph)
mean(fl_read2$Flesch)

fl_read <- textstat_readability(sixers_2021_articles$response.docs.lead_paragraph)
mean(fl_read$Flesch)
  