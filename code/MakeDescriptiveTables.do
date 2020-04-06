use "C:\Users\Ben\Google Drive\AsianBrazil\data\Brazil2017-2019WorkingCopy.dta"
estpost sum  b1 b2 b3 b12 b13 b21 b21a b32 b47a [aw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\ConfInstFactorVarsUsed.rtf", cell((mean sd))

estpost sum pol1 eff2_reordered conocim [aw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\COPIFactorVarsUsedUsed.rtf", cell((mean sd)) replace

estpost sum FemaleD q2
estpost tabstat i.EduCat etid IncomeCat year

tab EduCat, generate(EduCat)
rename EduCat1 EduCat_0_9
rename EduCat2 EduCat_10_13
rename EduCat3 EduCat_14P

tab IncomeCat, generate(IncomeCat)
rename IncomeCat1 IncomeCat_0_1050
rename IncomeCat2 IncomeCat_1051_1950
rename IncomeCat3 IncomeCat_1951_2550
rename IncomeCat4 IncomeCat_2551_4950
rename IncomeCat5 IncomeCat_4951p

tab etid, generate(etid)
rename etid1 etid_branco
rename etid2 etid_indi
rename etid3 etid_neg
rename etid4 etid_mul
rename etid5 etid_outro
rename etid6 etid_amarel

tab year, generate(year)
rename year1 year_2017
rename year2 year_2019


estpost sum FemaleD q2 EduCat_0_9 EduCat_10_13 EduCat_14P IncomeCat_0_1050 IncomeCat_1051_1950 IncomeCat_1951_2550 IncomeCat_4951p etid_branco etid_indi etid_neg etid_mul etid_outro etid_amarel year_2017 year_2019 [aw = wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\IndependentVariables.rtf", cell((mean sd)) replace
