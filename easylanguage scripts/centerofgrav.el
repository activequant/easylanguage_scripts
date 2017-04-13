//// Ehlers Center of Gravity Oscillator - coded by dn
//// From Cybernetic Analysis for Stocks and Futures

Inputs: Price((H+L)/2),
Length(10);

Vars: Count(0),
Num(0),
Denom(0),
CG(0);

Num = 0;Denom = 0;For count = 0 to length - 1 begin
Num = Num + (1+count)*Price[count];

Denom = Denom + (Price[count]);
End;

If Denom <> 0 then CG = -Num/Denom + (Length + 1)/2;

Plot1 (CG,"CG",black);
Plot2 (CG[1],"CG1",blue);