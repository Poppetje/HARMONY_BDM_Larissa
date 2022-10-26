# Day 2 # 
# Session 1a #
# Stat exercises.
require(PriorGen)
# Example 1
findbeta(themean = .9, percentile = .95, lower.v = F, percentile.value = .80)
# Example 2
findbeta(themean = .99, percentile = .95, lower.v = F, percentile.value = .90)
# Example 3
findbeta(themean = .01, percentile = .70, lower.v = F, percentile.value = .05)

# Exercise 1: Check if the above codes create the prior parameters for slides 1 to 3.

# Exercise 2: What if I wanted to create a beta prior for the specificity and I knew that 
# 1. the mean specificity lies between (0.4-0.6) and 
# 2. we are 95% certain that it is lower than 0.8

# Exercise 3: Plotting of priors based on hyperparameters of Beta distribution.

x=seq(0,1,0.001)
plot(x,dbeta(x,shape1 = 27.79, 3.09),type="l",lwd=3,ylab="Density (Sensitivity)")
lines(x,dbeta(x,shape1 = 7.59, .08),type="l",lwd=3,ylab="Density (Sensitivity)", col="red")

#  Plot the density for Example 3!


# Session 1b
# Programming Exercise.
# 1. Find beta source code.
View(findbeta)


# 2. Copy paste the source code below.

# 3. Create a new function called findbeta2 with the source code.

# 4. Change the source code to allow for (1) the hyperparameters Beta(a,b) to be returned from the function as values and (2) plot directly the prior distribution.

# 5. Perform exercise 2 automatically and not by hand.

# Solution below - Try first by yourselves.


# findbeta2<-function (themean = NULL, themedian = NULL, themode = NULL, 
#           percentile = 0.95, lower.v = F, percentile.value) 
# {
#   stopifnot((is.null(themean) + is.null(themedian) + is.null(themode)) == 
#               2)
#   if (is.null(themode) && is.null(themedian)) {
#     stopifnot((lower.v == T && themean <= percentile.value) | 
#                 (lower.v == F && themean >= percentile.value))
#   }
#   else if (is.null(themean) && is.null(themode)) {
#     stopifnot((lower.v == T && themedian <= percentile.value) | 
#                 (lower.v == F && themedian >= percentile.value))
#   }
#   else {
#     stopifnot((lower.v == T && themode <= percentile.value) | 
#                 (lower.v == F && themode >= percentile.value))
#   }
#   a = runif(1, 1, 10)
#   if (lower.v == T) {
#     pr_n = percentile
#   }
#   else {
#     pr_n = 1 - percentile
#   }
#   if (is.null(themode) && is.null(themedian)) {
#     to.minimize <- function(a) {
#       abs(qbeta(pr_n, shape1 = a, shape2 = a * (1 - themean)/themean) - 
#             percentile.value)
#     }
#   }
#   else if (is.null(themean) && is.null(themode)) {
#     to.minimize <- function(a) {
#       abs(qbeta(pr_n, shape1 = a, shape2 = (3 * a * (1 - 
#                                                        themedian) + 2 * themedian - 1)/(3 * themedian)) - 
#             percentile.value)
#     }
#   }
#   else {
#     to.minimize <- function(a) {
#       abs(qbeta(pr_n, shape1 = a, shape2 = (a * (1 - themode) + 
#                                               2 * themode - 1)/themode) - percentile.value)
#     }
#   }
#   estimate <- optim(runif(1, 1, 10), to.minimize, lower = 0.1, 
#                     upper = 10^4, method = "Brent")
#   finalshape1 = estimate$par
#   if (is.null(themode) && is.null(themedian)) {
#     finalshape2 = finalshape1 * (1 - themean)/themean
#   }
#   else if (is.null(themean) && is.null(themode)) {
#     finalshape2 = (3 * finalshape1 * (1 - themedian) + 2 * 
#                      themedian - 1)/(3 * themedian)
#   }
#   else {
#     finalshape2 = (finalshape1 * (1 - themode) + 2 * themode - 
#                      1)/themode
#   }
#   x<-seq(0,1,0.001)
#   plot(x,dbeta(x,finalshape1,finalshape2),type="l",lwd=3,ylab="Density")
#   return(c(round(finalshape1, 2), round(finalshape2, 2)))
# }
