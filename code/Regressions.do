use "C:\Users\Ben\Google Drive\AsianBrazil\data\Brazil2017-2019WorkingCopy.dta"

svyset upm [pw=wt], strata(estratopri)

global ylist COPI_PCA_01 COPI_Factor_01 TrustInstitutions_PCA_01 TrustInstitutions_Factor_01

* No interactions
eststo COPI_PCA: reg COPI_PCA_01 i.EduCat FemaleD q2 i.IncomeCat i.etid i.year [pw=wt]
eststo COPI_Factor: reg COPI_Factor_01 i.EduCat FemaleD q2 i.IncomeCat i.etid i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\COPI.rtf", replace label

*education and race interaction
eststo COPI_PCA: reg COPI_PCA_01 i.EduCat##i.etid FemaleD q2 i.IncomeCat i.etid i.year [pw=wt]
eststo COPI_Factor: reg COPI_Factor_01 i.EduCat##i.etid FemaleD q2 i.IncomeCat i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\COPI_EduInteraction.rtf", replace label


*No interactions
eststo TrustInstitutions_PCA: reg TrustInstitutions_PCA_01 i.EduCat FemaleD q2 i.IncomeCat i.etid i.year [pw=wt]
eststo TrustInstitutions_Factor: reg TrustInstitutions_Factor_01 i.EduCat FemaleD q2 i.IncomeCat i.etid i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\TrustInstitutions.rtf", replace label

*Education and race interactions
eststo TrustInstitutions_PCA: reg TrustInstitutions_PCA_01 i.EduCat##i.etid FemaleD q2 i.IncomeCat i.year [pw=wt]
eststo TrustInstitutions_Factor: reg TrustInstitutions_Factor_01 i.EduCat##i.etid FemaleD q2 i.IncomeCat i.year [pw=wt]
esttab using "C:\Users\Ben\Google Drive\AsianBrazil\output\TrustInstitutions_EduInteraction.rtf", replace label


foreach y in $ylist{
  reg `y' i.EduCat FemaleD q2 i.IncomeCat i.etid i.year [pw=wt]
}

foreach y in $ylist{
  reg `y' i.EduCat FemaleD q2 i.IncomeCat AsianD i.year [pw=wt]

}

foreach y in $ylist{
  reg `y' i.EduCat##i.etid FemaleD q2 i.IncomeCat i.year [pw=wt]

}

foreach y in $ylist{
  reg `y' i.EduCat##AsianD FemaleD q2 i.IncomeCat i.year [pw=wt]

}
