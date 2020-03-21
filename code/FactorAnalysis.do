use "C:\Users\Ben\Google Drive\AsianBrazil\data\Brazil2017-2019.dta"

factor pol1 conocim eff2

gen eff2_reordered = 1 if eff2 == 7
replace eff2_reordered = 2 if eff2 == 6
replace eff2_reordered = 3 if eff2 == 5
replace eff2_reordered = 4 if eff2 == 4
replace eff2_reordered = 5 if eff2 == 3
replace eff2_reordered = 6 if eff2 == 2
replace eff2_reordered = 7 if eff2 == 1

label define eff2_reordered 1 "StronglyAgree" 7 "StronglyDisagree"
label values eff2_reordered eff2_reordered


factor pol1 conocim eff2_reordered
rotate
predict COPI_Factor

pca pol1 conocim eff2_reordered
rotate
predict COPI_PCA


* scale the COPIs to a 0 to 1 scale
gen COPI_Factor_01 = (COPI_Factor+1.704657)/(1.379137+1.704657)
replace COPI_Factor_01 = 0 if COPI_Factor_01 < 0.04
replace COPI_Factor_01 = 1 if COPI_Factor_01 >0.99
replace COPI_Factor_01 = . if COPI_Factor == .

gen COPI_PCA_01 = (COPI_PCA+1.785106)/(2.015754+1.785106)


* clean things
gen FemaleD = 0
replace FemaleD = 1 if q1 == 2

gen Age = q2

*regs
reg COPI_PCA_01 q1 q2 ed i.etid

factor jc10 jc13 jc15a b1 b2 b3 b12 b13 b21 b21a b32 b47a m2 media3 ing4 pn4

*trust in institutions factor? 
factor b1 b2 b3 b12 b13 b21 b21a b32 b47a m2
