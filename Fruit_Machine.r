#Author Robert Tunn 2021

#FRUIT MACHINE: A FIST FULL OF DOLLARS

#Emulate a pub fruit machine comprising four spinning wheels in R Studio
#Use four separate throw of fair di style simulations to emulate the actions of 
#the spinning rollers on a fruit machine

#Four wheels each with 8 possible symbols:
#1: Lucky Number 7;
#2: Dog;
#3: Bar of Gold;
#4: Cherry
#5: Diamond;
#6: Heart;
#7: Club; 
#8: Spade

#Prompt user for number of simulated games, check that the machine is fair and
#then proceed to run that number of simulated games, collect data on outcomes
#and present data in useful manner

#PART 1: ARE THE SPINNERS FAIR?

#Are the spinners fair?

#Assign four variables, one for each spinning wheel, run a simulation for a user
#defined number of times and output a histogram of the results for each wheel.
#If the machine is fair each wheel should produce each symbol 1/8th of the total
#number of simulations. The higher the number the more evenly spread the 
#results which should represent a constant distribution 

#Let user define number of simulations are set as an integer

numberOfSimulations <- as.integer(readline(
  prompt = "Enter desired number of simulated games: "))

#Spinner 1
spinnerTest1 = sample(1:8, numberOfSimulations, replace = T)

hist(spinnerTest1, breaks = seq(from = 0, to = 8, by = 1),
     main = "Spinner 1",
     xlab = "Distribution of outcomes for spin",
     ylab = "Number of spins with outcome",
     )

#Spinner 2
spinnerTest2 = sample(1:8, numberOfSimulations, replace = T)

hist(spinnerTest2, breaks = seq(from = 0, to = 8, by = 1),
     main = "Spinner 2",
     xlab = "Distribution of outcomes for spin",
     ylab = "Number of spins with outcome",
)

#Spinner 3
spinnerTest3 = sample(1:8, numberOfSimulations, replace = T)

hist(spinnerTest3, breaks = seq(from = 0, to = 8, by = 1),
     main = "Spinner 3",
     xlab = "Distribution of outcomes for spin",
     ylab = "Number of spins with outcome",
)

#Spinner 4
spinnerTest4 = sample(1:8, numberOfSimulations, replace = T)

hist(spinnerTest4, breaks = seq(from = 0, to = 8, by = 1),
     main = "Spinner 4",
     xlab = "Distribution of outcomes for spin",
     ylab = "Number of spins with outcome",
)

#A recommended 100000 simulations demonstrates the fairness of the wheels

#PART 2: OBTAIN THE DISTRIBUTION OF RELEVANT OUTCOMES

#So, let an imaginary user play the machine for $2.00 per game and set variable
#to 2 decimal places:

costPerGame = 2.00
format(round(costPerGame, 2), nsmall = 2)

#Take the outcomes of spinner 1, spinner 2, spinner 3 and spinner 4
#Run each spinning wheel once and arrange data

#spinner1 = sample(1:8, 1)  #Pull lever
#spinner2 = sample(1:8, 1)  #Pull lever
#spinner3 = sample(1:8, 1)  #Pull lever
#spinner4 = sample(1:8, 1)  #Pull lever

#It may be useful to creates arrays at some points in the analysis
#chance = c(spinner1, spinner2, spinner3, spinner4)  #What is the outcome of the
#four pulls?

#Set variables for tallying relevant outcomes. Separate calculations given in
#Wordpad file:

#6 possible wheel matches for doubles
double.1.2 = 0
double.1.3 = 0
double.1.4 = 0
double.2.3 = 0
double.2.4 = 0
double.3.4 = 0

#4 possible wheel matches for trebles
treble.1.2.3 = 0
treble.1.2.4 = 0
treble.1.3.4 = 0
treble.2.3.4 = 0

#1 possible wheel match for quadruple
quadruple.1.2.3.4 = 0

for (i in 1:numberOfSimulations) {
 
  spinner1 = sample(1:8, 1)
  spinner2 = sample(1:8, 1)
  spinner3 = sample(1:8, 1)
  spinner4 = sample(1:8, 1)
  
  #Use conditional statement to record number of doubles
  ##6 possible wheel matches for doubles:
  
  if (spinner1 == spinner2) {
    
    double.1.2 <- double.1.2 + 1
  }
  
  if (spinner1 == spinner3) {
    
    double.1.3 <- double.1.3 + 1
  }
  
  if (spinner1 == spinner4) {
    
    double.1.4 <- double.1.4 + 1
  }
  
  if (spinner2 == spinner3) {
    
    double.2.3 <- double.2.3 + 1
  }
  
  if (spinner2 == spinner4) {
    
    double.2.4 <- double.2.4 + 1
  }
  
  if (spinner3 == spinner4) {
    
    double.3.4 <- double.3.4 + 1
  }
  
  #Use conditional statement to record number of trebles
  ##3 possible wheel matches for trebles:
  if (spinner1 == spinner2 && spinner2 == spinner3) {
    
    treble.1.2.3 <- treble.1.2.3 + 1
  }

  if (spinner1 == spinner2 && spinner2 == spinner4) {
  
  treble.1.2.4 <- treble.1.2.4 + 1
  }
  
  if (spinner1 == spinner3 && spinner3 == spinner4) {
    
    treble.1.3.4 <- treble.1.3.4 + 1
  }

  if (spinner2 == spinner3 && spinner3 == spinner4) {
  
  treble.2.3.4 <- treble.2.3.4 + 1
  }

  #Use conditional statement to record number of quadruples
  ##1 possible wheel match for quadruples:
  if (spinner1 == spinner2 && spinner2 == spinner3 && spinner3 == spinner4) {
      
    quadruple.1.2.3.4 <- quadruple.1.2.3.4 + 1
  
  }
  
}

#Tally up and display number of doubles and trebles. Quadruples already done.
totalDoubles = double.1.2 + double.1.3 + double.1.4 + double.2.3 + double.2.4 + double.3.4
totalTrebles = treble.1.2.3 + treble.1.2.4 + treble.1.3.4 + treble.2.3.4

print(paste("The total number of doubles is:", totalDoubles))
print(paste("The total number of trebles is:", totalTrebles))
print(paste("The total number of quadruples is:", quadruple.1.2.3.4))

#PART 3 - DISPLAY DISTRIBUTION OF OUTCOMES

outcomeDistribution = c(totalDoubles, totalTrebles, quadruple.1.2.3.4)

outcomesLabel = c("Doubles", "Trebles", "Quadruples")

barplot(outcomeDistribution, main ="Distribution of Outcomes",
        xlab = "Type of Outcome",
        ylab = "Number of Outcomes",
        names.arg = outcomesLabel)

#PART 4 - CALCULATE THE AMOUNT OF PROFIT

#Total amount of money put into machine/ gross profits
totalInput = as.integer(numberOfSimulations * costPerGame)
print(paste("The total pre-payout takings based on 100000 simulated games is: �",
            totalInput))

#Set levels of winnings for each level
doubleReward = 1
trebleReward = 10
quadrupleReward = 100

#If $1.00 is paid for a double (i.e. half the money back), $10.00 for a treble
#and $100 for a quadruple the total payouts for each level are:
doublePayouts = totalDoubles * doubleReward
treblePayouts = totalTrebles * trebleReward
quadruplePayouts = quadruple.1.2.3.4 * quadrupleReward

#The sum of all payouts is:
totalPayouts = doublePayouts + treblePayouts + quadruplePayouts
print(paste("The total amount of money paid out based on 100000 simulated games is: �",
            totalPayouts))

#Profit for the simulated games
netIncome = totalInput - totalPayouts
print(paste("The total profit based on", numberOfSimulations,
            "simulated games is: �", netIncome))

#Calculate and output the net percentage in favour of casino operator
percentageTake = (netIncome / totalInput) * 100
percentagePayout = 100 - percentageTake
print(paste("The total percentage take based on", numberOfSimulations,
            "simulated games is:", percentageTake, "%"))
print(paste("The total percentage payout based on", numberOfSimulations,
            "simulated games is:", percentagePayout, "%"))

#PART 5 - IS THE MACHINE LEGAL???

#NOTE: Under US law a fruit machine must have a minimum payout of 75% that is to
#say a maximum of 25% of takings can go to the casino operator and this machine
#would be within the legal limits


#Conditional statements on legality of machine
if (percentagePayout < 75) {
  
  print(paste("With a payout rate of", percentagePayout,
              "% this machine would be illegal"))
}

if (percentagePayout >= 75) {
  
  print(paste("With a payout rate of", percentagePayout,
              "% this machine would be legal"))
}

