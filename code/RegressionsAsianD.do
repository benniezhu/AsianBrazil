use "C:\Users\Ben\Google Drive\AsianBrazil\data\Brazil2017-2019WorkingCopy.dta"

* No interactions
eststo COPI_PCA: reg COPI_PCA_01 i.EduCat FemaleD q2 i.IncomeCat AsianD i.year [pw=wt]
eststo COPI_Factor: reg COPI_Factor_01 i.EduCat FemaleD q2 i.IncomeCat AsianD i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\AsianDummy\COPI.rtf", replace label


*education and race interaction
eststo COPI_PCA: reg COPI_PCA_01 i.EduCat##AsianD FemaleD q2 i.IncomeCat AsianD i.year [pw=wt]
eststo COPI_Factor: reg COPI_Factor_01 i.EduCat##AsianD FemaleD q2 i.IncomeCat i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\AsianDummy\COPI_EduInteraction.rtf", replace label

*race and income interaction
eststo COPI_PCA: reg COPI_PCA_01 i.EduCat FemaleD q2 i.IncomeCat##AsianD i.year [pw=wt]
eststo COPI_Factor: reg COPI_Factor_01 i.EduCat FemaleD q2 i.IncomeCat##AsianD i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\AsianDummy\COPI_RaceIncome.rtf", replace label


*No interactions
eststo TrustInstitutions_PCA: reg TrustInstitutions_PCA_01 i.EduCat FemaleD q2 i.IncomeCat AsianD i.year [pw=wt]
eststo TrustInstitutions_Factor: reg TrustInstitutions_Factor_01 i.EduCat FemaleD q2 i.IncomeCat AsianD i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\AsianDummy\TrustInstitutions.rtf", replace label

*Education and race interactions
eststo TrustInstitutions_PCA: reg TrustInstitutions_PCA_01 i.EduCat##AsianD FemaleD q2 i.IncomeCat i.year [pw=wt]
eststo TrustInstitutions_Factor: reg TrustInstitutions_Factor_01 i.EduCat##AsianD FemaleD q2 i.IncomeCat i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\AsianDummy\TrustInstitutions_EduInteraction.rtf", replace label

*race and income interaction
eststo TrustInstitutions_PCA: reg TrustInstitutions_PCA_01 i.EduCat FemaleD q2 i.IncomeCat##AsianD i.year [pw=wt]
eststo TrustInstitutions_Factor: reg TrustInstitutions_Factor_01 i.EduCat FemaleD q2 i.IncomeCat##AsianD i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\AsianDummy\TrustInstitutions_RaceIncome.rtf", replace label
