head(USArrests)
#name of states
#states<-USArrests$state
#print(states)
## substr function is used to take the part of string
library(stringr)
states <- row.names.data.frame(USArrests)
states
substr(x = states, start = 1, stop = 4)
# abbreviate state names
states2 = abbreviate(states)
states2
# size (no of letters) of each name, counts spaces too
state_chars = nchar(states)
state_chars
# longest name
states[which(state_chars == max(state_chars))]
# get states names with k, use grep function and indicate pattern="k"
grep(pattern = "k", x = states, value = TRUE)
# get states names with w or W
grep(pattern = "[wW]", x = states, value = TRUE)
#another solution is to convert all the state names to lower case
# get states names with w
grep(pattern = "w", x = tolower(states), value = TRUE)
# alternatively get states names with  W
grep(pattern = "W", x = toupper(states), value = TRUE)
#or we can ask to ignore case 
grep(pattern = "w", x = states, value = TRUE, ignore.case = TRUE)
head(USArrests)
# names of states
#states = USArrests$state
#understand histogram
#it will show how many times each value appear 
x=c(1,1,1,2,2,3)
hist(x)
# histogram for no of characters in states
#use to show no of amino acid sequences in many protein sequences



#We can use regexpr() to get the number oftimes that a searched pattern is found
#in a character vector. When there is no match, we get -1 
# position of a's
positions_a = gregexpr(pattern = "a", text = states, ignore.case = TRUE)
#it will give 1,3,5,7 for Alabama
positions_a

#but if we want to count number of a's in each state 
num_a = sapply(positions_a, function(x) ifelse(x[1] > 0, length(x), 0))
library(stringr)
str_count(states, "a")  
str_count(tolower(states),"a")
vowels = c("a", "e", "i", "o", "u")
# vector for storing results
#this starts five counters at the same time
num_vowels = vector(mode = "integer", length = 5)
# calculate number of vowels in each name
#for j in vowels takes a,e,i,o,u respectively
for (j in seq_along(vowels)) {
  num_aux = str_count(tolower(states), vowels[j])
  num_vowels[j] = sum(num_aux)
}  
names(num_vowels) = vowels
num_vowels

