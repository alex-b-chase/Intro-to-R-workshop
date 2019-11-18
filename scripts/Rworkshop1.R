##################################
##################################
##    R workshop for SIOBUGS    ##
##################################
##################################

# open-source statistical software 
# large number of “packages” for R freely downloadable from [CRAN](http://cran.us.r-project.org/) (Comprehensive R Archive Network) 
# individual packages do pretty much everything!

# R basics
3+12
3 + 12

# R (unlike other languages) does not care about spaces between functions

2*8 			# multiplication
5 - pi 			# subtraction
14/5			# division
14 %/% 5		# integer division
sqrt(25)		# square root


# assign variables into the R environment
z = 5
z
z <- 3
z

y = sqrt(36)
y

# The number [1] before the answers just means that this item is the first element of a vector (vectors can be thought of as a collection of related values, such as a column in a data table).


# some more basic functions
10^2			# power function
log(10)			# natural logarithm (i.e. ln)
log10(10)		# log base 10
log2(10)		# log base 2
factorial(10)	# factorial

# Questions with your partner
##  1/ 	How does R represent when the output of a function is not a number? Try an example.
##  2/	What is the difference between log and log10?
##  3/	Given a right triangle with sides x=5 and y=13, calculcate the length of the hypotenuse in R (reminder: a^2 + b^2 = c^2)
##  4/	If a population starts with a density of 5 individuals/hectare and grows exponentially at a growth rate r=0.04/year, what is the size of the population in π years? (reminder: intrinsic rate of growth == dN/dt = rN)

# x = 5
# y = 13
# c = sqrt((x^2) + (y^2))

# Nt = No * e^(rt)
# Nt <- 5 * exp(0.04 * pi)

##################################
##	BREAK 1
##################################

# open a new R script (workplace)
# this provides a record of what you did and can save this for later use!

# VECTORS!
# most functions in R can be applied to vectors of data, not just individual data points
# many only make sense when applied to vectors, such as the following that calculate sums, first differences, and cumulative sums.

X = 1:10
x

# vector of ten values from 1 to 10, demonstrates the basic R syntax for creating a sequence of numbers

seq(1, 10, by = 0.5)
seq(1, by = 0.5, length = 10)
rep(1, 10)
x = seq(0, 3, by = 0.01)


sum(1:10)  		# sum up all values in a vector
diff(1:10)		# calculate the differences between adjacent values in a vector 
cumsum(1:10)	# cumulative sum of values in a vector
prod(1:10)		# product of values in a vector


# Questions with your partner
##  1/	Describe the difference in output between sum and cumsum.
##  2/	Generate a sequence of even numbers from -6 to 6
##  3/	Generate a sequence of values from -4.8 to -3.43 that is length 8 (show code)
##  	a.	What is the difference between values in this sequence?
##  	b.	What is the sum of the exponential of this sequence?

# seq(-6, 6, by = 2)
# x <- seq(-4.8, -3.43, length = 8)
# unique(diff(x))[1]
# sum(exp(x))

##################################
## BREAK 2
##################################

## Combining vectors

# simple function "c( )"" in R that “combines” vectors or numbers into a single vector
x = c(1,7)
x
y = c(10:15,3,9)
y
c(x,y)

# Vectors can also be used for indexing other vectors
y[x]  			# return the 1st and 7th element of y

# combine vectors to build up data frames by “binding” them together either are rows or as columns
p = 1:10
q = 10:1
cbind(p,q)  	# bind as columns
rbind(q,p)		# bind as rows

## Logical operators and indexing

# R can perform standard logical comparisons, syntax for the different logical operators, some of which are odd:

#		>	greater than
#		<	less than
#		>=	greater than or equal to
#		<=	less than or equal to
#		==	equal to (TWO equals signs...you were very close!)
#		!=	not equal


1 > 3
5 < 7
4 >= 4
-11 <= pi
log(1) == 0
exp(0) != 1

# combine multiple logical operators using the symbols for ‘and’ (&) and ‘or’ ( | )
w = 4
w > 0 & w < 10
w < 0 | w > 10

# "logical" expression like "y > x" in R you get a TRUE/FALSE
z = y>13
z

# logical operations are performed element-by-element. 
# If you want to apply a logical test to a whole vector at a time you can use the function "any" to test if any of the values are true and 
# "all" to test if all values are true
any(y>13)
all(y>13)

# Questions with your partner
##  1/	Create a vector that contains the names of 4 super heroes.
##  2/	What is the difference between = and == ?

##################################
## BREAK 3
##################################

# working and saving data

setwd('path/to/directory')

frogs = c(1.1, 1.3, 1.7, 1.8, 1.9, 2.1, 2.3, 2.4,
2.5, 2.8, 3.1, 3.3, 3.6, 3.7, 3.9, 4.1, 4.5,
4.8, 5.1, 5.3)

tadpoles = rnorm(n = 20, mean = 2 * frogs, sd = 0.5)

dat <- cbind(tadpoles, frogs)

# working with data
# One of the first things you’ll do with any data set when you first load it up is some basic checks to see what you are dealing with.
# Typing the variable name will show you its contents, but if you just loaded up something with a million entries then you’ll sit for a long time as R lists every number on the screen.
# The function class will tell you the type of data you’ve just loaded.  

class(dat)

# helpful TOOL
# Be aware that RStudio has the capacity to auto-complete function names, function arguments, and file names

# So, for example, if you type ‘read.t’ and then hit TAB, RStudio will finish typing read.table and it would also show what information you can specify for the read.table function.  

# If you type read.table( and then hit TAB, RStudio will allow you to select the function argument that you want to fill in. 

# If you type read.table(“ and then hit TAB, RStudio will show you the files in your current working directory and allow you to select one. 

# If there are a lot of files in the directory, you can start typing the file name you want and then hit TAB again and RStudio will limit what it shows to just those files that match what you’ve typed so far


# save the R environment and variables to use later
save(dat, x, y, c, file = "Lab1.RData")

# have students close and exit R, open a new window and:
setwd('path/to/directory')
load("Lab1.RData")

# or save EVERYTHING so far:
save.image("Lab1_all.RData")

# not sure what variables you have defined,
ls()


# visualize dataframe in R environment

# save as .csv file (like Excel format)
write.table(dat, "my_frogs.csv", row.names = FALSE, sep = ",")


# character data in R is usually displayed in double quotes to indicate that it is character data (e.g. the character “1” rather than the number 1)
# Note that when your data is characters you'll need double-quotes in your comparison. e.g. 
a = c("north","south","east","west")
# also do logical comparisons with characters as well
a == "east"


# get the basic structure of the data

dat <- read.table("frogs.txt", header = TRUE, sep = '\t')

class(dat)

# dat is in a “data.frame”, which is like a matrix but can also contain non-numeric data.
# basic (or atomic) data types in R are integer, numeric (decimal), logical (TRUE/FALSE), factors, and character


str(dat)

# from this we learn that there are four columns of data named “frogs”, “tadpoles”, “color”, “spots” and 
# that there are 20 rows of data, and 
# that the data is numeric for the first two, a factor for the third, and logical for the fourth.

names(dat)
# get the names of the columns (remember we used header = TRUE!!!)

dim(dat)
# get dimensions of dataframe
nrow(dat)
ncol(dat)

# We can refer to specific columns of data by name using the $ syntax
# useful with auto-complete TAB function!

dat$frogs  			# show just the ‘frogs’ column
dat$color[6:10]		# show the 6th though 10th elements of the color column

# for a single vector, use length
length(dat$frogs)

# preview the data (useful if working with really large files!)
head(dat)
tail(dat)

# get quick statisticsal summary of each vector in the dataframe
summary(dat)

# Questions with your partner
##  1/ Try a few of these functions out and discuss with your partner. What else do you notice about these?

##################################
## BREAK 4
##################################

# Organizing data for analysis!

# simple comparisons can provide a powerful means for subsetting data
# the "," is needed to identify subsetting from where (e.g. columns or rows)
dat[dat$frogs >= 3,]

# or use the R built-in functions
subset(dat,frogs >= 3)

# or if you only want a specific columns in the output
subset(dat, frogs >= 3, c("tadpoles","spots"))

# Questions with your partner
##  1/	For the frog data set: 
##    a.	display just the rows where frogs have spots
##    b.	display just the rows where frogs are blue
##    c.	how many blue tadpoles are there?
##    d.	create a new object containing just the rows where there are between 3 and 5 tadpoles
##    e.	display just the rows where there are less than 2.5 red frogs
##    f.	display where either frogs do not have spots or there are more than 5 frogs

##################################
## BREAK 5
##################################

# Analyzing data and basic statistical inference

# want the ability to summarize and visualize data
table(dat$color)
table(dat$color,dat$spots)

# basic statistical measurements - expanding on summary() function
mean(dat$frogs)
median(dat$tadpoles)
var(dat$frogs)  							## variance
sd(dat$frogs)								## standard deviation
cov(dat$frogs, dat$tadpoles)				## covariance
cor(dat$frogs, dat$tadpoles)				## correllation
quantile(dat$tadpoles, c(0.05,0.90))		## 5% and 90% quantiles
min(dat$frogs)								## smallest value
max(dat$frogs)								## largest value

# R also has a set of apply functions for applying any function to sets of values within a data structure.
apply(dat[,1:2], 1, sum)  	        # calculate sum of frogs & tadpoles by row (1st dimension)
apply(dat[,1:2], 2, sum)	        # calculate sum of frogs & tadpoles by column (2nd dimension)

# function "apply" will apply a function to either every row (dimension 1) or every column (dimension 2) of a matrix or data.frame. 
# In this example the commands apply the “sum” function to the first two columns of the data (frogs & tadpoles) first calculated by 
# row (the total number of individuals in each population) and 
# second by column (the total number of frogs and tadpoles)

tapply(dat$frogs, dat$color, mean)          			# calculate mean of frogs by color
tapply(dat$frogs, dat[, c("color","spots")], mean)  		# calculate mean of frogs by color & spots

# function "tapply" will apply a function to an R data object, grouping data according to a second variable or set of variables. 
# The first example applies the “mean” function to frogs grouping them by color. 
# The second shows that tapply can be used to apply a function over multiple groups, in this case color X spots. 

# PLOT DATA

plot(dat$frogs, dat$tadpoles)  					## x-y scatter plot
abline(a = 0, b = 1)							## add a 1:1 line (intercept=0, slope=1)

plot.new()

hist(dat$tadpoles)								## histogram
abline(v = mean(dat$tadpoles))					## add a vertical line at the mean

pairs(dat)										## all pairwise scatter plots

plot.new()

barplot(tapply(dat$frogs, dat$color, mean))		## barplot of frogs by color
abline(h = 3)									## add a horizontal line at 3

# Assignment for Friday - show all your work and stored variables
# Submit to Andrew the .Rdata file or .R script through Canvas
##  1/	Plot the following lines from 0 to 3 (hint: define x as a sequence with a small step size). Make sure to make the resolution of x sufficiently small to see the curves
##  	a. 	ln(x)
##  	b. 	e^{-x}
##  2/	Make a barplot of the median number of frogs grouped by whether they have spots or not.
##  3/	Plot a histogram of only blue frogs. Please include the code to subset data as well.
##  4/	Use apply to calculate the across-population standard deviations in the numbers of frogs and tadpoles



