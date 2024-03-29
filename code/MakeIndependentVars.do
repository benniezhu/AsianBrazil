use "C:\Users\Ben\Google Drive\AsianBrazil\data\Brazil2017-2019WorkingCopy.dta"

gen EduCat = 0 if ed < 10
replace EduCat = 1 if ed >= 10 & ed <=13
replace EduCat = 2 if ed >= 14
label define EduCat 0 "<10Anos" 1 "10-13Anos" 2 "14+Anos"
label values EduCat EduCat

gen UniversityD = 0
replace UniversityD = 1 if ed >= 14

label define UniversityD 0 "NaoSuperior" 1 "Superior"
label values UniversityD UniversityD

gen AsianD = 0
replace AsianD = 1 if etid == 1506
label define AsianD 0 "NaoAmarelo" 1 "Amarelo"
label values AsianD AsianD


gen FemaleD = 0
replace FemaleD = 1 if sex == 2

gen IncomeCat= 0 if q10new <= 3
replace IncomeCat = 1 if q10new > 3 & q10new <= 8
replace IncomeCat = 2 if q10new > 8 & q10new <= 11
replace IncomeCat = 3 if q10new > 11 & q10new <=  14
replace IncomeCat =4 if q10new > 14
label define IncomeCat 0 "<1050R" 1 "1051-1950R" 2 "1951-2550R" 3 "2551-4950R" 4 "4951R+"
label values IncomeCat IncomeCat

label define etid 1 "Branco" 3 "Indigina" 4 "Negro" 5 "Mulatto" 7 "Outro" 1506 "Amarelo"
label values etid etid

gen Etid2 = etid

replace Etid2 = 4 if Etid2 == 5
replace Etid2 = 7 if Etid2 == 3
label define Etid2 1 "Branco" 4 "Negro/Mulatto" 7 "Outro" 1506 "Amarelo"
label values Etid2 Etid2
