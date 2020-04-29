library(haven) 
library(tidyverse)
library(psych)

Brazil2017_2019WorkingCopy <- read_dta("D:/Data/AsianBrazilData/data/Brazil2017-2019WorkingCopy.dta")
View(Brazil2017_2019WorkingCopy)

attach(Brazil2017_2019WorkingCopy)
COPI_Vars = cbind(pol1_1_7, eff2_reordered, conocim_1_7)
CI_Vars = cbind(b1, b2, b3,b4, b6, b12, b13, b21, b21a, b32, b47a)

## COPI Factor
COPI_fit_poly = fa.poly(COPI_Vars, 1)
COPI_score_poly = factor.scores(COPI_Vars, COPI_fit_poly$fa)
COPI_score_poly = COPI_fit_poly$scores
mean(na.omit(COPI_score_poly$scores))

COPI_fit_poly

## CI Factor 
CI_fit_poly = fa.poly(CI_Vars,1)
CI_fit_poly
CI_score_poly = factor.scores(CI_Vars, CI_fit_poly$fa)
CI_score_poly = CI_fit_poly$scores


view(CI_score_poly$scores)


mean(na.omit(CI_score_poly$scores))
# force into df so you can cbind it back in

require(reshape2)     
CI_score_poly$

Brazil_COPI=cbind(Brazil2017_2019WorkingCopy, COPI_score_poly$scores)
Brazil_CI = cbind(Brazil2017_2019WorkingCopy, CI_score_poly$scores)

Brazil_COPI_CI = cbind(Brazil_COPI, CI_score_poly$scores)
library(foreign)
write_dta(Brazil_COPI_CI, "D:/Data/AsianBrazilData/data/Brazil2017_2019RIndexPolyT2.dta")



rm(Brazil_COPI_CI)
