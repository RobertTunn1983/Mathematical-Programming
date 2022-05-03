#GROUP 19 - THE OPPORTUNISTIC CHANCERS
#Emulate a pub fruit machine in R Studio
#Use three separate throw of fair di style simulations to emulate the actions of 
#the spinning rollers on a fruit machine
#Three wheels each with 8 possible symbols:
#1: Cat; 2: Dog; 3: Bar of Gold; 4: Cherry 5: Diamond; 6: Heart; 7: Club; 
#8: Spade

#Are the spinners fair? (ok, its a computer simulation, of course they are, but a
#regulatory body like the gaming commission would check this regularly)

#Assign three variables, one for each spinning wheel, run a simulation 10000 
#times and output a histogram of the results for each wheel. If the machine is
#fair each wheel should produce each symbol 1/8th of the time

#Is there a sensible cut off limit - is 1 million too high or too low?

#Spinner 1

spinnerTest1 = sample(1:8, 1000000, replace = T)

hist(spinnerTest1, breaks = seq(from = 0, to = 8, by = 1),
     main = "Spinner 1",
     xlab = "Distribution of outcomes for spin",
     ylab = "Number of spins with outcome",
     )

#Add legend with symbols to histogram

#Spinner 2

spinnerTest2 = sample(1:8, 1000000, replace = T)

hist(spinnerTest2, breaks = seq(from = 0, to = 8, by = 1),
     main = "Spinner 2",
     xlab = "Distribution of outcomes for spin",
     ylab = "Number of spins with outcome",
)

#Add legend with symbols to histogram

#Spinner 3

spinnerTest3 = sample(1:8, 1000000, replace = T)

hist(spinnerTest3, breaks = seq(from = 0, to = 8, by = 1),
     main = "Spinner 3",
     xlab = "Distribution of outcomes for spin",
     ylab = "Number of spins with outcome",
)

#Add legend with symbols to histogram

#Results seem to show that the wheels are fair and that using a simulation based
#on dice can be used for spinning wheels. It would be good to have 8 figures for the
#outputs rather than looking at them on the graph



#So, let an imaginary user play the machine, amount that is bet is irrelevant (probably always �1.00)

#Take the outcomes of spinner 1, spinner 2 and spinner 3 and arrange data into an array (vector)
#Run each spinning wheel once and arrange data

spinner1 = sample(1:8, 1, replace = T)  #Pull lever
spinner2 = sample(1:8, 1, replace = T)  #Pull lever
spinner3 = sample(1:8, 1, replace = T)  #Pull lever

chance = c(spinner1, spinner2, spinner3)  #What is the outcome of the three pulls?

#So, take this code and simulate an entire year's worth of gamblers using the machine,
#say 10 000 of them in a big pub

double = 0
treble = 0

for (i in 1:10000) {
 
  spinner1 = sample(1:8, 1, replace = T)
  spinner2 = sample(1:8, 1, replace = T)
  spinner3 = sample(1:8, 1, replace = T)
  
  #Use conditional statement to record number of doubles
  if (spinner1 == spinner2 || spinner2 == spinner3) {
    
    double <- double + 1
  }
  
  #Use conditional statement to record number of trebles
  if (spinner1 == spinner2 && spinner2 == spinner3) {
    
    treble <- treble + 1
  }
  
  }

double
treble




