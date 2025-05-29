# R basics
# types of Events in probability 

#✅ 1. Simulating a Sample Space
sample_space <- c("Heads", "Tails")
sample_space

#Independent events - Tossing two coins 

coin1 = sample(c("H", "T"), 1)
coin2 = sample(c("H","T"), 1)
paste("coin 1 : ", coin1, "| Coin 2: ", coin2)

#✅ 3. Dependent Events – Drawing Without Replacement

#Drawing 2 cards from a deck without replacement
#This is a dependent event because the second draw depends on the first card being removed.

deck = paste(rep(c("A", 2:10, "J","Q", "K" ), 4), rep(c("♠", "♥", "♦", "♣"), each = 13))
draw = sample(deck, 2, replace = FALSE) # without replace ment 
draw


#Mutually Exclusive events 
#Odd and even are mutually exclusive outcomes in a single roll.


roll = sample(1:6, 3) #This line simulates rolling a six-sided die once.
#sample(1:6, 1) randomly selects one number from the set {1, 2, 3, 4, 5, 6}.

if(roll%%2 == 0){
  cat ("Even number:" , roll)
  }else {
    cat ("Odd number: ", roll)
  
  }

roll = sample(1:6, 3)

for (r in roll) {
  if (r %% 2 == 0) {
    cat("Even number:", r, "\n")
  } else {
    cat("Odd number:", r, "\n")
  }
}


# Equallly likely event 
# rollinfg a die 1000 times 

rolls= sample (1:6, 1000, replace = TRUE)
table(rolls)