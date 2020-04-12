use "C:\Users\Ben\Google Drive\AsianBrazil\data\Brazil2017-2019WorkingCopyRIndexs.dta"

*standardize 0-1
sum COPI_R CI_R

egen COPI_R_Max = max(COPI_R)
egen COPI_R_Min = min(COPI_R)

egen CI_R_Max = max(CI_R)
egen CI_R_Min = min(CI_R)

gen COPI_R_01= (COPI_R-COPI_R_Min)/(COPI_R_Max-COPI_R_Min)
gen CI_R_01 = (CI_R - CI_R_Min)/(CI_R_Max-CI_R_Min)

*Education and race interactions
eststo COPI : reg COPI_R_01 i.Etid2##UniversityD FemaleD q2 i.IncomeCat i.year
eststo CI : reg CI_R_01 i.Etid2##UniversityD FemaleD q2 i.IncomeCat i.year

esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\FactorRegs_RFactors.rtf", star(+ 0.1 * 0.05 ** 0.01 ) replace label

eststo COPI_AsianD: reg COPI_R_01 AsianD##UniversityD FemaleD q2 i.IncomeCat i.year
eststo CI_AsianD:reg CI_R_01 AsianD##UniversityD FemaleD q2 i.IncomeCat i.year
