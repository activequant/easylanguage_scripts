Inputs: price((H+L)/2),
Len(13);

Var: MaxH(0),
MinL(0),
Fish(0);

MaxH = Highest(Price, Len);
MinL = Lowest(Price, Len);

Value1 = .5*2*((Price-MinL)/(MaxH-MinL)-.5)+.5*Value1[1];

If Value1 > .9999 then Value1 = .9999;
If Value1 < -.9999 then Value1 = -.9999;

Fish = 0.25*Log((1+Value1)/(1-Value1)) +.5*Fish[1];

Plot1 (Fish, "Fisher");
Plot2 (Fish[1],"Trigger");