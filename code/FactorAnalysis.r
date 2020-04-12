library(haven)
library(survey)
library(psych)
library(tidyverse)
library(questionr)
Brazil2017_2019WorkingCopy <- read_dta("data/Brazil2017-2019WorkingCopy.dta")
View(Brazil2017_2019WorkingCopy)
attach(Brazil2017_2019WorkingCopy)

COPI_Vars = cbind(pol1, eff2_reordered, conocim )
COPI_fit = fa(COPI_Vars, 1)
COPI_score = factor.scores(COPI_Vars, COPI_fit)
COPI_score = COPI_score$scores
Brazil = cbind(Brazil2017_2019WorkingCopy, COPI_score)
mean(na.omit(COPI_score))
KMO(COPI_Vars)
psych::alpha(COPI_Vars)

CI_Vars = cbind(b1, b2, b3,b4, b6, b12, b13, b21, b21a, b32, b47a)
CI_fit = fa(CI_Vars, 1)
CI_score = factor.scores(CI_Vars, CI_fit)
CI_score= CI_score$scores
Brazil2=cbind(Brazil, CI_score)
mean(na.omit(CI_score))
KMO(CI_Vars)
psych::alpha(CI_Vars)

library(foreign)
write_dta(Brazil2, "C:/Users/Ben/Google Drive/AsianBrazil/data/Brazil2017_2019.dta")


