use "D:\Data\AsianBrazilData\data\Brazil2017_2019RIndexPolyT2.dta"
rename MR1 COPI_MR1
rename MR1 COPI_MR1_1
rename MR1 COPI_MR1_2
rename missing COPI_missing
rename R2 COPI_R2
rename MR1 CI_MR1

factortest pol1_1_7 eff2_reordered  conocim_1_7
factortest b1 b2 b3 b4 b6 b12 b13 b21 b21a b32 b47a

alpha pol1_1_7 eff2_reordered  conocim_1_7
alpha b1 b2 b3 b4 b6 b12 b13 b21 b21a b32 b47a

save "D:\Data\AsianBrazilData\data\Brazil2017_2019RIndexPolyT2.dta", replace
