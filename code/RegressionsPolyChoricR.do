use "D:\Data\AsianBrazilData\data\Brazil2017_2019RIndexPolyT2.dta"

*standardize 0-1

egen COPI_MR1_Max = max(COPI_MR1)
egen COPI_MR1_Min = min(COPI_MR1)

egen CI_MR1_Max = max(CI_MR1)
egen CI_MR1_Min = min(CI_MR1)

gen COPI_MR1_01 = (COPI_MR1 - COPI_MR1_Min)/(COPI_MR1_Max-COPI_MR1_Min)
gen CI_MR1_01 = (CI_MR1- CI_MR1_Min)/(CI_MR1_Max-CI_MR1_Min)

eststo COPI_SemInt : reg COPI_MR1_01 i.Etid2 UniversityD FemaleD q2 i.IncomeCat i.year
eststo CI_SemInt : reg CI_MR1_01 i.Etid2 UniversityD FemaleD q2 i.IncomeCat i.year


eststo COPI : reg COPI_MR1_01 i.Etid2##UniversityD FemaleD q2 i.IncomeCat i.year
eststo CI : reg CI_MR1_01 i.Etid2##UniversityD FemaleD q2 i.IncomeCat i.year

esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\FactorRegs_RFactorsPolyChoric.rtf", star(+ 0.1 * 0.05 ** 0.01 ) replace label
