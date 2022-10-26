library(runjags); library(PriorGen)
setwd("C:/Users/Julio/OneDrive/OneDrive - Universidad Complutense de Madrid (UCM)/Julandro 2014/VISAVET 2018/Proyectos/COST action Bayesian/workshop Larissa 2022")
#initial scenario with small sample size: results from the experiment
Positives <- 35
N <- 121

#model{
  # Likelihood part:
  #Positives ~ dbinom(prevalence, N)
  
  # Prior part:
  #prevalence ~ dbeta(1, 1)
  
  # Hooks for automatic integration with R:
  #data# Positives, N
  #monitor# prevalence
  #inits# prevalence
#}

# scenario 1: non-informative (weakly informative) priors
prevalence <- list(chain1=0.05, chain2=0.95)

results1 <- run.jags('ap_prev.txt', n.chains=2, burnin=5000, sample=10000)
plot(results1)
results1


#scenario 2: highly informative priors: prevalence is below 3%, most likely value is around 0.5%, 1/200 animals
#scenario 3: somewhat informative priors: prevalence is below 10%, most likely value is around 3%

#Large sample size
Positives <- 3500
N <- 12100

results4 <- run.jags('ap_prev.txt', n.chains=2, burnin=5000, sample=10000)
results5 <- run.jags('ap_prev2.txt', n.chains=2, burnin=5000, sample=10000)
results6 <- run.jags('ap_prev3.txt', n.chains=2, burnin=5000, sample=10000)
db_large <- rbind(as.data.frame(results4$summaries), as.data.frame(results5$summaries), as.data.frame(results6$summaries))
db_large$prior_inf <- c("weak", "high", "intermediate")
db_large #is there an impact of the prior?
