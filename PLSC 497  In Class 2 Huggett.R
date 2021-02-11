# Manupulating text in R

#1. Find a sentence online. Save it as a string. 

require(quanteda)

s1 <- 'does anyone still have any space in their group'

#2. Select only the third word of the sentence. Save it as a new string.

s2 <- substr(s1, 13 ,  17)

#3. Choose a letter that appears in your sentence. Use the gsub command to replace all instances of that letter with a period. 

gsub('s', '.', s1)

