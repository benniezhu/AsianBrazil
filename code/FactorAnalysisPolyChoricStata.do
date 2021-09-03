use "D:\Data\AsianBrazilData\data\Brazil2017-2019WorkingCopy.dta"
polychoric b1 b2 b3 b4 b6 b12 b13 b21 b21a b32 b47a
global CI_N = r(sum_w)
matrix ConfInst = r(R)
factormat ConfInst, n($CI_N) factors(1)
predict ConfInst_Poly
