/////  - coded by Dave Newberg - http://www.davenewberg.com /////
///// Cycle Period Indicator by John Ehlers - Measures the Cycle Period - coded by dn
//// From Cybernetic Analysis for Stocks and Futures
Inputs: Price((H+L)/2);
Vars: Imult (.635),
Qmult (.338),
InPhase(0),
Quadrature(0),
Phase(0),
DeltaPhase(0),
count(0),
InstPeriod(0),
Period(0);
If CurrentBar > 5 then begin
{Detrend Price}
Value3 = Price - Price[7];
{Compute InPhase and Quadrature components}
Inphase = 1.25*(Value3[4] - Imult*Value3[2]) + Imult*InPhase[3];
Quadrature = Value3[2] - Qmult*Value3 + Qmult*Quadrature[2];
{Use ArcTangent to compute the current phase}
If AbsValue(InPhase +InPhase[1]) > 0 then Phase = ArcTangent(AbsValue((Quadrature+Quadrature[1]) / (InPhase+InPhase[1])));
{Resolve the ArcTangent ambiguity}
If InPhase < 0 and Quadrature > 0 then Phase = 180 - Phase;
If InPhase < 0 and Quadrature < 0 then Phase = 180 + Phase;
If InPhase > 0 and Quadrature < 0 then Phase = 360 - Phase;
{Compute a differential phase, resolve phase wraparound, and limit delta phase errors}
DeltaPhase = Phase[1] - Phase;
If Phase[1] < 90 and Phase > 270 then DeltaPhase = 360 + Phase[1] - Phase;
If DeltaPhase < 1 then DeltaPhase = 1;
If DeltaPhase > 60 then Deltaphase = 60;
{Sum DeltaPhases to reach 360 degrees. The sum is the instantaneous period.}
InstPeriod = 0;
Value4 = 0;
For count = 0 to 50 begin
Value4 = Value4 + DeltaPhase[count];
If Value4 > 360 and InstPeriod = 0 then begin
InstPeriod = count;
end;
end;
{Resolve Instantaneous Period errors and smooth}
If InstPeriod = 0 then InstPeriod = InstPeriod[1];
Period = .25*(InstPeriod) + .75*Period[1];
Plot1(Period, "DC CycleMeas",darkred);
end;