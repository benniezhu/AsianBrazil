use "C:\Users\Ben\Google Drive\AsianBrazil\data\Brazil2017-2019WorkingCopy.dta"

factor pol1 conocim eff2_reordered [aw = wt], ml

factor b1 b2 b3 b12 b13 b21 b21a b32 b47a [aw=wt], ml
