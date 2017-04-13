{2 Pole Butterworth Filter - //// From 'Cybernetic Analysis for Stocks and Futures' by John Ehlers //// code compiled by dn
} // plot on a subgraph separate from the price region.

Input: Price((H+L)/2), Period(15);
Var: a1(0), b1(0), coef1(0), coef2(0), coef3(0), Butter(0);

a1=expvalue(-1.414*3.14159/Period);
b1=2*a1*Cosine(1.414*180/Period);
coef2=b1;
coef3=-a1*a1;
coef1=(1-b1+a1*a1)/4;
Butter = coef1*(Price+2*Price[1]+Price[2])+ coef2*Butter[1] + coef3*Butter[2];
If CurrentBar<3 then Butter=Price;
Plot1(Butter,"Butter");