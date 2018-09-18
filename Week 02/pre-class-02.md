# pre-class
### Test Comment for git check 
### For 9/18/2018


Make sure you commit this often with meaningfull messages. 

### Background

The exponential distribution is defined by its cumulative distribution function
\(F(x) = 1-e^{-\lambda x}\)

The R function ***rexp()*** generates random variables with an exponential distribution. For example 
<center><strong>rexp(n=10, rate=5)</strong> </center>

results in 10 exponentially distributed numbers with a rate \(\lambda=5\). If you leave out the 5 and just have
<center><strong>rexp(n=10) </strong></center>
then this results in 10 exponentially distributed numbers with a rate \(\lambda=1\), this is also referred to as the "standard exponential distribution". 

### Part 1


1. Generate 200 random values from the standard exponential distribution and store them in a vector `exp.draws.1`.  Find the mean and standard deviation of `exp.draws.1`.

####Create 'exp.draws.1'
    exp.draws.1 <- rexp(n=200) 
    mean(exp.draws.1) 
    sd(exp.draws.1)
  

2. Repeat, but change the rate to 0.2, 5, 7.3 and 10, storing the results in vectors called  `exp.draws.0.2`,  `exp.draws.5`,  `exp.draws.7.3` and  `exp.draws.10`. 

####Additional expodentials
    exp.draws.0.2 <- rexp(n=200, .2) 
    exp.draws.5 <- rexp(n=200, 5) 
    exp.draws.7.3 <- rexp(n=200, 7.3)
    exp.draws.10 <- rexp(n=200, 10) 


3. The function `plot()` is the generic function in R for the visual display of data. `hist()` is a function that takes in and bins data as a side effect. To use this function, we must first specify what we'd like to plot.
    a. Use the `hist()` function to produce a histogram of your standard exponential distribution. 
    b. Use `plot()` with this vector to display the random values from your standard distribution in order.
    c. Now, use `plot()` with two arguments -- any two of your other stored random value vectors -- to create a scatterplot of the two vectors against each other.
    
####Histograms and Plots
    hist(exp.draws.1)
    plot(exp.draws.1)
    plot(exp.draws.10,exp.draws.7.3)

4. We'd now like to compare the properties of each of our vectors. Begin by creating a vector of the means of each of our five distributions in the order we created them and saving this to a variable name of your choice. Using this and other similar vectors, create the following scatterplots and explain in words what is going on:
    a. The five means versus the five rates used to generate the distribution.
    
####Calculate means
    mean1<-mean(exp.draws.1)
    mean.2<-mean(exp.draws.0.2)
    mean5<-mean(exp.draws.5)
    mean7.3<-mean(exp.draws.7.3)
    mean10<-mean(exp.draws.10)
    
    
####Vector of means 
    meanvector<-c(mean1,mean.2,mean5,mean7.3,mean10)
    
####Vector of rates 
    ratevector<-c(1,.2,5,7.3,10)
    
####plot graph 
    plot(ratevector,meanvector)
    
Recall the formula of the expodential distribution, \(\lambda\) is in the expodential.  the distribution is destined to 1 as x approaches infinity.  However the larger \(\lambda\) is the faster this will happen, and the likelier we are to get smaller numbers with (F(x) = 1-e^{-\lambda x}\), thus the decreasing means seen in this graph. (From almost 5 for .2 decreasing to below 1 and approaching 0)


   b. The standard deviations versus the rates.
    
####Calculate Standard Deviations
    sd1<-sd(exp.draws.1)
    sd.2<-sd(exp.draws.0.2)
    sd5<-sd(exp.draws.5)
    sd7.3<-sd(exp.draws.7.3)
    sd10<-sd(exp.draws.10)
####Vector of standard deviations
    sdvector<-c(sd1,sd.2,sd5,sd7.3,sd10)
####Vector of rates
    ratevector<-c(1,.2,5,7.3,10)
####plot graph
    plot(ratevector,sdvector)
    
Following the same logic as a the numbers tend to be smaller at an expodential rate, so the aren't as far apart from eachother.  This leads to a similar relationshipas seen in a.  
    
  c. The means versus the standard deviations.
####Means vs Standard Deviations
    plot(meanvector,sdvector)
    
The means and standard deviations are almost the same for each \(\lambda\), so we see a essentially linear relationshiop reflecting this.

For each plot, explain in words what's going on.

#### Part II (PHP 2560 Only)


5. R's capacity for data and computation is large to what was available 10 years ago. 
  a. To show this, generate 1.1 million numbers from the standard exponential distribution and store them in a vector called `big.exp.draws.1`. Calculate the mean and standard deviation.
    
####Create 'big.exp.draws.1' then find mean and sd    
    big.exp.draws.1 <- rexp(n=1100000)
    mean(big.exp.draws.1)
    sd(big.exp.draws.1)
    
    
  b. Plot a histogram of `big.exp.draws.1`.  Does it match the function \(1-e^{-x}\)?  Should it? 
  
####Hist plot  
    hist(big.exp.draws.1)
    
    
  c. Find the mean of all of the entries in `big.exp.draws.1` which are strictly greater than 1. You may need to first create a new vector to identify which elements satisfy this.
  
####Create "Less Vector" : no values <1  
    Less <- big.exp.draws.1[big.exp.draws.1>1]
    mean(Less)
  
  
  
  d. Create a matrix, `big.exp.draws.1.mat`, containing the the values in 
`big.exp.draws.1`, with 1100 rows and 1000 columns. Use this matrix as the input to the `hist()` function and save the result to a variable of your choice. What happens to your data?

####Matrix manipulations continued    
    big.exp.draws.1.mat <- matrix(big.exp.draws.1, nrow=1100, ncol=1000)
    HistEL <- hist(big.exp.draws.1.mat) ###Short for Hist Exp Large
    HistEL


  e. Calculate the mean of the 371st column of `big.exp.draws.1.mat`.
  
####Mean for `big.exp.draws.1` 
    mean(big.exp.draws.1.mat[,371])
   
   
    
  f. Now, find the means of all 1000 columns of `big.exp.draws.1.mat` simultaneously. Plot the histogram of column means.  Explain why its shape does not match the histogram in problem 5b).
  
####Create Vector of Column means
    ExpColMeans <- c()
    for (i in 1:1000) {
      ExpColMeans[i] <- mean(big.exp.draws.1.mat[,i])}
      hist(ExpColMeans)
   
